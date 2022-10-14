import 'package:flutter/cupertino.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BleProvider with ChangeNotifier {

  FlutterBluetoothSerial serial = FlutterBluetoothSerial.instance;
  List<BluetoothDevice> pairingList = [];
  List<BluetoothDiscoveryResult> bleList =
  List<BluetoothDiscoveryResult>.empty(growable: true);
  BluetoothDevice? selectDevice;
  bool bleConnected = false;
  BluetoothConnection? connection;
  void scanBle() {
    serial.startDiscovery().listen((event) {
      final existingIndex = bleList.indexWhere(
              (element) => element.device.address == event.device.address);
      if (existingIndex >= 0) {
        bleList[existingIndex] = event;
      } else {
        var deviceName =
        (event.device.name != null) ? event.device.name : '알 수 없는 기기';

        if (deviceName!.contains('AgroSPM')) {
          bleList.add(event);
        }
      }
    }).onDone(() {
      // findBleDevices = true;
      // print('END $findBleDevices');
      notifyListeners();
    });
  }

  Future<void> getPairingList() async {
    await serial.getBondedDevices().then((List<BluetoothDevice> bondedDevices) {
      pairingList = bondedDevices
          .where((element) => element.name!.contains('AgroSPM'))
          .toList();
      pairingList.sort((a, b) => a.name!.compareTo(b.name!));
    }).then((value) {
      // findPairingDevices = true;
      notifyListeners();
    });
  }

}
