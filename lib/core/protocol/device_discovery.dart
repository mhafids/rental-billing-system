import 'dart:async';
import 'package:nsd/nsd.dart' as nsd;
import 'package:tlogger/logger.dart';

class AndroidTvDevice {
  final String name;
  final String host;
  final int port;

  AndroidTvDevice({
    required this.name,
    required this.host,
    required this.port,
  });
}

class DeviceDiscovery {
  final _devices = <AndroidTvDevice>[];
  final _onDevicesUpdate = StreamController<List<AndroidTvDevice>>.broadcast();
  final _logger = TLogger('DeviceDiscovery');
  Stream<List<AndroidTvDevice>> get onDevicesUpdate => _onDevicesUpdate.stream;

  final List<nsd.Discovery> _discoveries = [];

  Future<void> initDiscovery() async {
    _logger.info('Initializing discovery...');
    nsd.disableServiceTypeValidation(true);
    await stopDiscovery();
    _devices.clear();
    _onDevicesUpdate.add(_devices);

    final serviceTypes = ['_androidtvremote2._tcp', '_androidtvremote._tcp'];
    
    for (final type in serviceTypes) {
      _logger.debug('Starting discovery for $type');
      final discovery = await nsd.startDiscovery(type);
      _discoveries.add(discovery);
      
      discovery.addListener(() {
        _logger.debug('Update from $type: ${discovery.services.length} services found');
        _updateDevices();
      });
    }
  }

  void _updateDevices() {
    final allServices = _discoveries.expand((d) => d.services).toList();
    
    // De-duplicate by host/port
    final seen = <String>{};
    final uniqueDevices = <AndroidTvDevice>[];
    
    for (final service in allServices) {
      final key = '${service.host}:${service.port}';
      if (!seen.contains(key)) {
        seen.add(key);
        uniqueDevices.add(AndroidTvDevice(
          name: service.name ?? 'Unknown Device',
          host: service.host ?? '',
          port: service.port ?? 6466,
        ));
      }
    }

    _devices.clear();
    _devices.addAll(uniqueDevices);
    _onDevicesUpdate.add(_devices);
  }

  Future<void> stopDiscovery() async {
    if (_discoveries.isNotEmpty) {
      _logger.info('Stopping all discovery sessions...');
      for (final discovery in _discoveries) {
        await nsd.stopDiscovery(discovery);
      }
      _discoveries.clear();
    }
  }
}
