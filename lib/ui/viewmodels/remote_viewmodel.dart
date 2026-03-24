import 'package:flutter/material.dart';
import '../../core/protocol/device_discovery.dart';
import '../../core/protocol/pairing_session.dart';
import '../../core/protocol/remote_manager.dart';
import '../../core/protocol/certificate_generator.dart';
import '../../proto/remotemessage.pbenum.dart';
import 'package:tlogger/logger.dart';

enum ConnectionStatus { idle, discovering, pairing, connecting, connected, error }

class RemoteViewModel extends ChangeNotifier {
  final _discovery = DeviceDiscovery();
  final _logger = TLogger('RemoteViewModel');
  List<AndroidTvDevice> devices = [];
  
  ConnectionStatus status = ConnectionStatus.idle;
  AndroidTvDevice? selectedDevice;
  String? errorMessage;
  
  PairingSession? _pairingSession;
  RemoteManager? _remoteManager;
  
  String? certPem;
  String? keyPem;

  RemoteViewModel() {
    _discovery.onDevicesUpdate.listen((updatedDevices) {
      devices = updatedDevices;
      notifyListeners();
    });
    startDiscovery();
  }

  void startDiscovery() {
    _logger.info('Starting device discovery');
    status = ConnectionStatus.discovering;
    devices = [];
    _discovery.initDiscovery();
    notifyListeners();
  }

  Future<void> connectToIp(String ip, {int port = 6466}) async {
    if (ip == '127.0.0.0') {
      _logger.warning('Detected 127.0.0.0, which is likely incorrect. Suggesting 127.0.0.1');
      errorMessage = '127.0.0.0 is invalid. Did you mean 127.0.0.1?';
      status = ConnectionStatus.error;
      notifyListeners();
      return;
    }
    
    final device = AndroidTvDevice(
      name: 'Manual Device ($ip)',
      host: ip,
      port: port,
    );
    _logger.info('Manual connection to $ip:$port initiated');
    await selectDevice(device);
  }

  Future<void> selectDevice(AndroidTvDevice device) async {
    _logger.info('Selected device: ${device.name} (${device.host})');
    selectedDevice = device;
    status = ConnectionStatus.pairing;
    notifyListeners();

    // Generate certs if not present
    if (certPem == null || keyPem == null) {
      final certs = CertificateGenerator.generateFull();
      certPem = certs['cert'];
      keyPem = certs['key'];
    }

    _logger.info('Initiating pairing with ${device.host}:${device.port}');
    _pairingSession = PairingSession(
      host: device.host,
      port: device.port,
      clientCertPem: certPem!,
      clientKeyPem: keyPem!,
      deviceName: 'Flutter Remote',
    );

    _pairingSession!.onSecretRequired.listen((_) {
      notifyListeners();
    });

    _pairingSession!.onPaired.listen((success) {
      if (success) {
        startRemote();
      } else {
        errorMessage = 'Pairing failed. Please check your device and try again.';
        status = ConnectionStatus.error;
        notifyListeners();
      }
    });

    try {
      await _pairingSession!.start();
    } catch (e) {
      _logger.error('Error starting pairing: $e');
      errorMessage = 'Could not connect: ${e.toString()}';
      status = ConnectionStatus.error;
      notifyListeners();
    }
  }

  void submitSecret(String code) {
    _pairingSession?.sendSecret(code);
  }

  Future<void> startRemote() async {
    if (selectedDevice == null) return;
    
    status = ConnectionStatus.connecting;
    notifyListeners();

    _remoteManager = RemoteManager(
      host: selectedDevice!.host,
      clientCertPem: certPem!,
      clientKeyPem: keyPem!,
    );

    _remoteManager!.onReady.listen((_) {
      status = ConnectionStatus.connected;
      notifyListeners();
    });

    await _remoteManager!.start();
  }

  void sendKey(RemoteKeyCode key) {
    _remoteManager?.sendKey(key, RemoteDirection.SHORT);
  }
}
