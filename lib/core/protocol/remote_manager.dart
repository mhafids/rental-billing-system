import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:tlogger/logger.dart';
import '../../proto/remotemessage.pb.dart';

class RemoteManager {
  final String host;
  final int port;
  final String clientCertPem;
  final String clientKeyPem;

  SecureSocket? _socket;
  final _chunks = <int>[];

  final _onReady = StreamController<void>.broadcast();
  final _logger = TLogger('RemoteManager');
  Stream<void> get onReady => _onReady.stream;

  RemoteManager({
    required this.host,
    this.port = 6466,
    required this.clientCertPem,
    required this.clientKeyPem,
  });

  Future<void> start() async {
    try {
      final context = SecurityContext();
      context.useCertificateChainBytes(utf8.encode(clientCertPem));
      context.usePrivateKeyBytes(utf8.encode(clientKeyPem));

      _logger.info('Connecting to remote service at $host:$port');
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
        onDone: () => _logger.info('Remote socket closed'),
        onError: (error) {
          _logger.error('Remote socket error: $error');
        },
      );
    } catch (e) {
      _logger.error('Failed to connect to remote service: $e');
      rethrow;
    }
  }

  void _onData(Uint8List data) {
    _chunks.addAll(data);
    
    if (_chunks.isNotEmpty && _chunks[0] == _chunks.length - 1) {
      final message = RemoteMessage.fromBuffer(_chunks.sublist(1));
      _handleMessage(message);
      _chunks.clear();
    }
  }

  void _handleMessage(RemoteMessage message) {
    _logger.debug('Received remote message');
    if (message.hasRemoteConfigure()) {
      final config = RemoteMessage()
        ..remoteConfigure = (RemoteConfigure()
          ..code1 = 622
          ..deviceInfo = (RemoteDeviceInfo()
            ..model = 'Flutter Remote'
            ..vendor = 'Junior Dev'
            ..unknown1 = 1
            ..unknown2 = '1'
            ..packageName = 'androidtv-remote-flutter'
            ..appVersion = '1.0.0'));
      _send(config);
      _onReady.add(null);
    } else if (message.hasRemoteSetActive()) {
      final active = RemoteMessage()
        ..remoteSetActive = (RemoteSetActive()..active = 622);
      _send(active);
    } else if (message.hasRemotePingRequest()) {
      final pingResponse = RemoteMessage()
        ..remotePingResponse = (RemotePingResponse()..val1 = message.remotePingRequest.val1);
      _send(pingResponse);
    }
  }

  void sendKey(RemoteKeyCode key, RemoteDirection direction) {
    final inject = RemoteMessage()
      ..remoteKeyInject = (RemoteKeyInject()
        ..keyCode = key
        ..direction = direction);
    _send(inject);
  }

  void _send(RemoteMessage message) {
    if (_socket == null) return;
    try {
      final buffer = message.writeToBuffer();
      final framed = Uint8List(buffer.length + 1);
      framed[0] = buffer.length;
      framed.setAll(1, buffer);
      _socket?.add(framed);
    } catch (e) {
      _logger.error('Error sending remote message: $e');
    }
  }

  void stop() {
    _socket?.destroy();
  }
}
