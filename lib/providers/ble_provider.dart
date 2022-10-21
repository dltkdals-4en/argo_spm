import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../constants/constants.dart';

class BleProvider with ChangeNotifier {

  FlutterBluetoothSerial serial = FlutterBluetoothSerial.instance;
  List<BluetoothDevice> pairingList = [];
  List<BluetoothDiscoveryResult> bleList =
  List<BluetoothDiscoveryResult>.empty(growable: true);
  BluetoothDevice? selectDevice;
  bool bleConnected = false;
  BluetoothConnection? connection;
  List<int> test = [];
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
  Future<void> connectBle(BuildContext context, Size size) async {
    if (!bleConnected) {
      await BluetoothConnection.toAddress(selectDevice!.address).then((value) {
        connection = value;
        bleConnected = value.isConnected;
        // saveDeviceInfo(selectDevice);f
        notifyListeners();

        connection!.input!.listen((event) {
          test += event;
          if (test.contains(41)) {


            if(test[3]==50){

              _onDataReceived(Uint8List.fromList(test));
              test.clear();
            }else{
              _onDataReceived(Uint8List.fromList(test));
              test.clear();
            }

          }
          // _onDataReceived(event);
          // notifyListeners();
        });
      }).catchError((e) {
        makeFToast(context, size, "기기 연결을 확인해주세요");

      });
    } else {
      bleConnected = false;
      if (connection != null) {
        connection!.dispose();

        connection = null;
      }

    }
  }
  String _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data

    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character

    String dataString = String.fromCharCodes(buffer);
    String dataString2 = String.fromCharCodes(data);

    // settingString(dataString);
    // outputText = dataString;
    notifyListeners();
    return dataString;

  }
}
