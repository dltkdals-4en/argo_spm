import 'dart:convert';
import 'dart:typed_data';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';

class BleProvider with ChangeNotifier {
  FlutterBluetoothSerial serial = FlutterBluetoothSerial.instance;
  List<BluetoothDevice> pairingList = [];
  List<BluetoothDiscoveryResult> bleList =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  bool getBleList = false;
  bool getPairingDevices = false;
  BluetoothDevice? selectDevice;
  bool bleConnected = false;
  BluetoothConnection? connection;
  List<int> test = [];

  Future<void> scanBle() async {
    if (getBleList == false) {
      serial.startDiscovery().listen((event) {
        final existingIndex = bleList.indexWhere(
            (element) => element.device.address == event.device.address);
        if (existingIndex >= 0) {
          bleList[existingIndex] = event;
        } else {
          var deviceName =
              (event.device.name != null) ? event.device.name : '알 수 없는 기기';

          if (deviceName!.contains('AgroSPM')) {
            print('ble List add');
            bleList.add(event);
          }
        }
      }).onDone(() {
        getBleList = true;
        notifyListeners();
      });
    }
  }

  void initBleDevices() {
    bleList.clear();
    getBleList = false;
    scanBle();
    notifyListeners();
  }

  Future<void> getPairingList() async {
    if (getPairingDevices == false) {
      await serial
          .getBondedDevices()
          .then((List<BluetoothDevice> bondedDevices) {
        pairingList = bondedDevices
            .where((element) => element.name!.contains('AgroSPM'))
            .toList();
        pairingList.sort((a, b) => a.name!.compareTo(b.name!));
      }).then((value) {
        getPairingDevices = true;
        // findPairingDevices = true;

        notifyListeners();
      });
    }
  }

  String deviceAddress = '';
  String deviceName = '';

  Future<void> getDeviceName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  Future<void> connectBleAuto(PrefsProvider prefsProvider) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    deviceAddress = prefs.getStringList('savedDevice')![1];
    deviceName = prefs.getStringList('savedDevice')![0];
    if (prefsProvider.spmState == 2) {
      await BluetoothConnection.toAddress(deviceAddress).then((value) {
        connection = value;
        bleConnected = value.isConnected;
        notifyListeners();
        connection!.input!.listen((event) {
          test += event;
          if (test.contains(41)) {
            if (test[3] == 50) {
              _onDataReceived(Uint8List.fromList(test));
              test.clear();
            } else {
              _onDataReceived(Uint8List.fromList(test));
              test.clear();
            }
          }
          // _onDataReceived(event);
          // notifyListeners();
        });
      }).catchError((e) {
        prefsProvider.setSpmState(1);
        print(prefsProvider.spmState);
        notifyListeners();
      });
    } else {
      bleConnected = false;
      prefsProvider.setSpmState(1);
      if (connection != null) {
        connection!.dispose();

        connection = null;
      }
    }
  }

  Future<void> connectBle(BuildContext context, Size size,
      BluetoothDevice device, PrefsProvider prefsProvider) async {
    if (!bleConnected) {
      await BluetoothConnection.toAddress(device.address).then((value) {
        connection = value;
        bleConnected = value.isConnected;
        deviceName = device.name!;
        // saveDeviceInfo(selectDevice);f
        prefsProvider.setSpmState(2);
        prefsProvider.deviceSave(deviceName, device.address);
        notifyListeners();

        connection!.input!.listen((event) {
          test += event;
          if (test.contains(41)) {
            if (test[3] == 50) {
              _onDataReceived(Uint8List.fromList(test));
              test.clear();
            } else {
              _onDataReceived(Uint8List.fromList(test));
              test.clear();
            }
          }
          // _onDataReceived(event);
          // notifyListeners();
        });
      }).catchError((e) {
        makeFToast(context, size, "기기 연결을 확인해주세요");
        notifyListeners();
      });
    } else {
      bleConnected = false;

      if (connection != null) {
        connection!.dispose();

        connection = null;
      }
      notifyListeners();
    }
  }

  Future<void> devicePairing(String address) async {
    await serial.bondDeviceAtAddress(address).catchError((e) {
      print(e);
    });
    notifyListeners();
  }

  String _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    print(data);
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

    settingResult(dataString);
    // outputText = dataString;
    notifyListeners();
    return dataString;
  }

  List<String> outputList = [];
  bool lampState = false;

  Future<void> changeLampState(bool state) async {
    if (!state) {
      sendData('\$preOperation()\r\n').then((value) {
        lampState = true;
        notifyListeners();
      });
    } else {
      sendData('\$endOperation()\r\n').then((value) {
        lampState = false;
        notifyListeners();
      });
    }
  }

  int waveIndex = 0;
  int measureIndex = 0;

  Future<void> sendMeasureData(int index) async {
    outputList.clear();
    String sendStr = '\$getSpectrumData()\r\n';
    measureIndex = index;

    // switch(index){
    //   case 0:
    //     waveIndex = 54;
    //     break;
    //   case 1:
    //     waveIndex = 14;
    //     break;
    //   case 2:
    //     waveIndex = 76;
    //     break;
    //
    // }
    var i = Uint8List.fromList(utf8.encode(sendStr));

    if (sendStr.length > 0) {
      try {
        connection!.output.add(i);
        await connection!.output.allSent;
        notifyListeners();
      } catch (e) {
        print('e: $e');
        // Ignore error, but notify state

      }
    }
  }

  String result = '';
  String resultOM = '';
  String resultN = '';
  String resultP = '';
  String selectedWave = '';

  void settingResult(String dataString) {
    var startString = dataString.substring(0, 4);
    if (startString == '\$102') {
      result = '';
      result = dataString.substring(5, dataString.length - 3);
      var list = result.split(',');
      switch (measureIndex) {
        case 0:
          resultOM = list[55];
          notifyListeners();
          break;
        case 1:
          resultN = list[15];
          notifyListeners();
          break;
        case 2:
          resultP = list[77];
          notifyListeners();
          break;
      }
    }
  }

  void settingString(String dataString) {
    var startString = dataString.substring(0, 4);

    // switch (startString) {
    //   case '\$102':
    //     result = '';
    //     result = dataString.substring(5, dataString.length - 3);
    //     var list = result.split(',');
    //     resultOM =list[14];
    //     resultN = list[54];
    //     resultP =list[76];
    //
    //     getResult();
    //     notifyListeners();
    //     break;
    //   case '\$103':
    //     var list = dataString.split(',');
    //     list.removeAt(0);
    //     waveList =
    //         list.toString().substring(1, list.toString().length - 4).split(',');
    //
    //     selectedWave = waveList[0];
    //     notifyListeners();
    //     break;
    //   default:
    //     break;
    // }
  }

  // void getResult() {
  //   if (result != '') {
  //     if (selectedWave != '') {
  //       var index = int.parse(selectedWave) / 5 - 68;
  //       selectedResult = result.split(',')[index.toInt()];
  //     } else {
  //       selectedResult = result.split(',')[0];
  //     }
  //   } else {
  //     selectedResult = '';
  //   }
  // }

  Future<void> sendData(String str) async {
    outputList.clear();
    String sendStr = '$str\r\n';

    var i = Uint8List.fromList(utf8.encode(sendStr));

    if (str.length > 0) {
      try {
        connection!.output.add(i);
        await connection!.output.allSent;
        notifyListeners();
      } catch (e) {
        print('e: $e');
        // Ignore error, but notify state

      }
    }
  }

  bool wavelength = false;

  Future<void> getWavelength() async {
    await sendData('\$connectSensor()\r\n').then((value) => wavelength = true);
  }

  bool recentBle = false;

  Future<void> setRecent(BuildContext context, String address, Size size,
      BluetoothDevice device, PrefsProvider prefs) async {
    if (!bleConnected) {
      await connectBle(context, size, device, prefs).then((value) {
        Navigator.of(context).pushNamed(Routes.root);
        getPairingDevices = false;
        notifyListeners();
      });
    }
  }

// void getRecent() {
//   if (connection == null || connection!.isConnected == false) {
//     recentBle = false;
//   } else {
//     recentBle = true;
//   }
// }
}
