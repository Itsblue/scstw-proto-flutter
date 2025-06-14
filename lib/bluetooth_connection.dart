import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logger/logger.dart';
import 'package:scstw_lib/connection.dart';
import 'package:scstw_lib/proto_out/Command.pb.dart';
import 'package:scstw_lib/proto_out/RaceState.pb.dart';
import 'package:scstw_lib/proto_out/Settings.pb.dart';

const btBaseUuid = '97ed638a-690f-4ce4-bb12-d9c4e0';
const btTimerServicePrefix = '${btBaseUuid}01';
const btTimerServiceUuid = '${btTimerServicePrefix}0000';

const remoteFileId = 'remoteId.txt';

class BaseStationBluetoothCharacteristics {
  final BluetoothCharacteristic raceFullState;
  final BluetoothCharacteristic control;
  final BluetoothCharacteristic settings;

  BaseStationBluetoothCharacteristics({
    required this.raceFullState,
    required this.control,
    required this.settings,
  });

  Future<void> sendCommand(Command command) async {
    await control.write(command.writeToBuffer());
  }

  Future<void> sendSettings(Settings settings) async {
    await this.settings.write(settings.writeToBuffer());
  }

  Stream<RaceFullState> get onRaceState {
    return raceFullState.lastValueStream.map((event) {
      return RaceFullState.fromBuffer(event);
    });
  }

  Stream<Settings> get onSettings {
    return settings.lastValueStream.map((event) {
      return Settings.fromBuffer(event);
    });
  }
}

//FIXME: Do we need this enum?
enum BaseStationConnectionEnum {
  disconnected,
  connected,
  connecting,
  disconnecting
}

class BluetoothConnection extends BaseStationConnection {
  final logger = Logger();
  final StreamController<BaseStationConnectionEnum> _baseStationConnectionStateController = StreamController<BaseStationConnectionEnum>.broadcast();
  Stream<BaseStationConnectionEnum> get baseStationConnectionStateStream => _baseStationConnectionStateController.stream;


  var bluetoothState = BluetoothAdapterState.unknown;
  var _baseStationConnectionState = BaseStationConnectionEnum.disconnected;

  late StreamSubscription<BluetoothConnectionState> _connectionStateSubscription;
  late StreamSubscription<BluetoothAdapterState> _bluetoothStateSubscription;

  late BluetoothDevice device;
  late BluetoothService service;
  late BaseStationBluetoothCharacteristics characteristics;

  BluetoothConnection.init() {
    _bluetoothStateSubscription = FlutterBluePlus.adapterState.listen((state) {
      switch (state) {
        case BluetoothAdapterState.on:
          bluetoothState = BluetoothAdapterState.on;
          break;
        case BluetoothAdapterState.unauthorized:
          bluetoothState = BluetoothAdapterState.unauthorized;
          logger.e('Bluetooth is unauthorized');
          break;
        case BluetoothAdapterState.off:
          bluetoothState = BluetoothAdapterState.off;
          if (_baseStationConnectionState ==
              BaseStationConnectionEnum.connected) {
            disconnect();
          }
          if (Platform.isAndroid) {
            try {
              FlutterBluePlus.turnOn();
            } catch (e) {
              logger.e('Failed to turn on Bluetooth');
            }
          }
          break;

        default:
          break;
      }
    });
  }

  @override
  void scan(Function(List<ScanResult>) onScanResult) {
    FlutterBluePlus.cancelWhenScanComplete(FlutterBluePlus.scanResults.listen(onScanResult));

    FlutterBluePlus.startScan(
        withServices: [Guid(btTimerServiceUuid)],
        timeout: const Duration(seconds: 5));
  }


  @override
  Future<void> connect(BluetoothDevice device) async {
    _baseStationConnectionState = BaseStationConnectionEnum.connecting;
    _baseStationConnectionStateController.add(BaseStationConnectionEnum.connecting);
    // Otherwise scan for devices
    // var onScan = FlutterBluePlus.scanResults.listen((results) async {
    //   // FlutterBluePlus.stopScan();
    //   // TODO: Handle multiple devices?
    //   if (results.isEmpty) {
    //     logger.e('No devices found');
    //     return;
    //   }
    //   final r = results.first;
    //   logger.d('${r.device.platformName} found! rssi: ${r.rssi}');
    //   device = r.device;
    //
    //
    //
    // });
    this.device = device;
    _connectionStateSubscription = device.connectionState.listen((state) {
      logger.d('Connection state: $state');
      switch (state) {
        case BluetoothConnectionState.connected:
          var services = device.discoverServices();
          services.then((value) async {
            service = value.firstWhere((element) => element.uuid == Guid(btTimerServiceUuid));
            characteristics = BaseStationBluetoothCharacteristics(
              raceFullState: service.characteristics.firstWhere((element) => element.uuid == Guid('${btTimerServicePrefix}0001')),
              control: service.characteristics.firstWhere((element) => element.uuid == Guid('${btTimerServicePrefix}0002')),
              settings: service.characteristics.firstWhere((element) => element.uuid == Guid('${btTimerServicePrefix}0003')),
            );
            characteristics.settings.setNotifyValue(true);
            await characteristics.settings.read();

            characteristics.raceFullState.setNotifyValue(true);
            await characteristics.raceFullState.read();

            logger.d('Set up characteristics');

            // characteristics.onRaceState.listen((event) {
            //   logger.d("Event: $event");
            // });
            _baseStationConnectionState = BaseStationConnectionEnum.connected;
            _baseStationConnectionStateController.add(BaseStationConnectionEnum.connected);
          });
          break;
        case BluetoothConnectionState.disconnected:
          _baseStationConnectionState = BaseStationConnectionEnum.disconnected;
          _baseStationConnectionStateController.add(BaseStationConnectionEnum.disconnected);
          break;
        default:
          break;
      }
    });


    await device.connect(autoConnect: false, mtu: 512);
    // FlutterBluePlus.cancelWhenScanComplete(onScan);

    // await FlutterBluePlus.turnOn();
    // await FlutterBluePlus.startScan(withServices: [Guid(btTimerServiceUuid)], timeout: const Duration(seconds: 5));

    // await FlutterBluePlus.isScanning.where((val) => val == false).first;
  }

  @override
  Future<void> disconnect() async {
    await device.disconnect();
    _connectionStateSubscription.cancel();
    _bluetoothStateSubscription.cancel();
    _baseStationConnectionState = BaseStationConnectionEnum.disconnected;
    _baseStationConnectionStateController.add(BaseStationConnectionEnum.disconnected);
  }

  @override
  Future<void> sendCommand(Command command) {
    if (_baseStationConnectionState != BaseStationConnectionEnum.connected) {
      throw Exception('Not connected');
    }
    return characteristics.sendCommand(command);
  }

  @override
  Future<void> sendSettings(Settings settings) {
    if (_baseStationConnectionState != BaseStationConnectionEnum.connected) {
      throw Exception('Not connected');
    }
    return characteristics.sendSettings(settings);
  }

  @override
  Stream<RaceFullState> get onRaceState {
    return characteristics.onRaceState;
  }

  @override
  Stream<Settings> get onSettings {
    return characteristics.onSettings;
  }

  // Stream<BaseStationConnectionEnum> get baseStationConnectionStateStream => _baseStationConnectionStateStream;

  BaseStationConnectionEnum get baseStationConnectionState => _baseStationConnectionState;
  // BluetoothAdapterState get connectionState => _conn;

}

