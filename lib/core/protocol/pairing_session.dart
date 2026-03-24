import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:convert/convert.dart';
import 'package:tlogger/logger.dart';
import '../../proto/pairingmessage.pb.dart';

class PairingSession {
  final String host;
  final int port;
  final String clientCertPem;
  final String clientKeyPem;
  final String deviceName;

  SecureSocket? _socket;
  final _chunks = <int>[];
  
  final _onSecretRequired = StreamController<void>.broadcast();
  Stream<void> get onSecretRequired => _onSecretRequired.stream;

  final _onPaired = StreamController<bool>.broadcast();
  final _logger = TLogger('PairingSession');
  Stream<bool> get onPaired => _onPaired.stream;

  PairingSession({
    required this.host,
    this.port = 6466,
    required this.clientCertPem,
    required this.clientKeyPem,
    required this.deviceName,
  });

  Future<void> start() async {
    try {
      _logger.info('Connectivity Check: Testing plain TCP reachability to $host:$port before handshake...');
      final testSocket = await Socket.connect(host, port, timeout: const Duration(seconds: 5));
      _logger.info('Connectivity Check: SUCCESS! Port $port is reachable.');
      await testSocket.close();
    } catch (e) {
      _logger.error('Connectivity Check: FAILURE! Port $port is NOT reachable. Please check your IP, ADB forwarding, and if the service is running in the AVD.');
      _logger.error('Error detail: $e');
      _onPaired.add(false);
      rethrow;
    }

    final context = SecurityContext();
    try {
      _logger.info('TLS Handshake: Starting SecureSocket connection to $host:$port');
      _logger.info('Security: Cert info - starts with: ${clientCertPem.substring(0, 30)}...');
      
      context.useCertificateChainBytes(utf8.encode(clientCertPem));
      context.usePrivateKeyBytes(utf8.encode(clientKeyPem));

      _socket = await SecureSocket.connect(
        host,
        port,
        context: context,
        onBadCertificate: (cert) {
          _logger.warning('Encountered bad certificate for $host, bypassing...');
          return true;
        },
      ).timeout(const Duration(seconds: 10));

      _socket!.listen(
        _onData, 
        onDone: () => _logger.info('Pairing socket closed'),
        onError: (error) {
          _logger.error('Socket error during pairing: $error');
          _onPaired.add(false);
        },
      );
    } on HandshakeException catch (e) {
      _logger.error('Handshake failed! Possible cause: TV rejected certificate or IP is wrong ($host). Error: $e');
      _onPaired.add(false);
      rethrow;
    } catch (e) {
      _logger.error('Failed to start pairing session: $e');
      _onPaired.add(false);
      rethrow;
    }
    
    final request = PairingMessage()
      ..protocolVersion = 2
      ..status = PairingMessage_Status.STATUS_OK
      ..pairingRequest = (PairingRequest()
        ..serviceName = 'android_tv_remote'
        ..clientName = deviceName);
    
    _send(request);
  }

  void _onData(Uint8List data) {
    _chunks.addAll(data);
    if (_chunks.isNotEmpty && _chunks[0] == _chunks.length - 1) {
      final message = PairingMessage.fromBuffer(_chunks.sublist(1));
      _handleMessage(message);
      _chunks.clear();
    }
  }

  void _handleMessage(PairingMessage message) {
    if (message.hasPairingRequestAck()) {
      final option = PairingMessage()
        ..protocolVersion = 2
        ..status = PairingMessage_Status.STATUS_OK
        ..pairingOption = (PairingOption()
          ..preferredRole = RoleType.ROLE_TYPE_INPUT
          ..inputEncodings.add(PairingEncoding()
            ..type = PairingEncoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
            ..symbolLength = 6));
      _send(option);
    } else if (message.hasPairingOption()) {
      final config = PairingMessage()
        ..protocolVersion = 2
        ..status = PairingMessage_Status.STATUS_OK
        ..pairingConfiguration = (PairingConfiguration()
          ..clientRole = RoleType.ROLE_TYPE_INPUT
          ..encoding = (PairingEncoding()
            ..type = PairingEncoding_EncodingType.ENCODING_TYPE_HEXADECIMAL
            ..symbolLength = 6));
      _send(config);
    } else if (message.hasPairingConfigurationAck()) {
      _onSecretRequired.add(null);
    } else if (message.hasPairingSecretAck()) {
      _onPaired.add(true);
      _socket?.destroy();
    }
  }

  void sendSecret(String code) {
    if (_socket == null) {
      _logger.warning('Attempted to send secret but socket is null');
      return;
    }
    
    _logger.info('Calculating and sending pairing secret');
    final clientCertData = X509Utils.x509CertificateFromPem(clientCertPem);
    // ignore: deprecated_member_use
    final clientPubDer = clientCertData.publicKeyData.bytes;
    if (clientPubDer == null) throw Exception('Public key not found');
    final clientPub = CryptoUtils.rsaPublicKeyFromDERBytes(
      Uint8List.fromList(hex.decode(clientPubDer)),
    );
    
    // 2. Get server cert modulus and exponent
    final serverCertDer = _socket!.peerCertificate!.der;
    final serverPub = CryptoUtils.rsaPublicKeyFromDERBytes(Uint8List.fromList(serverCertDer));

    // 3. Calculate Hash (SHA-256)
    final hashInput = BytesBuilder();
    hashInput.add(_bigIntToBytes(clientPub.modulus!));
    hashInput.add(_bigIntToBytes(clientPub.exponent!, prefixZero: true));
    hashInput.add(_bigIntToBytes(serverPub.modulus!));
    hashInput.add(_bigIntToBytes(serverPub.exponent!, prefixZero: true));
    
    // Code in hex, skip first 2 chars
    final codeHex = code.substring(2);
    hashInput.add(Uint8List.fromList(hex.decode(codeHex)));

    final digest = sha256.convert(hashInput.toBytes());
    
    final secret = PairingMessage()
      ..protocolVersion = 2
      ..status = PairingMessage_Status.STATUS_OK
      ..pairingSecret = (PairingSecret()..secret = digest.bytes);
    _send(secret);
  }

  Uint8List _bigIntToBytes(BigInt n, {bool prefixZero = false}) {
    var hexStr = n.toRadixString(16);
    if (hexStr.length % 2 != 0) hexStr = '0$hexStr';
    if (prefixZero) hexStr = '0$hexStr';
    return Uint8List.fromList(hex.decode(hexStr));
  }

  void _send(PairingMessage message) {
    if (_socket == null) return;
    try {
      final buffer = message.writeToBuffer();
      final framed = Uint8List(buffer.length + 1);
      framed[0] = buffer.length;
      framed.setAll(1, buffer);
      _socket?.add(framed);
    } catch (e) {
      _logger.error('Error sending pairing message: $e');
      _onPaired.add(false);
    }
  }
}
