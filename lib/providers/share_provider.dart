import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareProvider with ChangeNotifier {
  bool firstSpmCheck = true;
  String savedDevice = '';
  bool checkBleConneted = false;
  int spmState = 0;
  bool stateCheck = false;

  Future<void> spmStateCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    spmState = await prefs.getInt('spmState') ?? 0;
    notifyListeners();
    // switch (spmState) {
    //   case 0:
    //     break;
    //   case 1:
    //     break;
    //   case 2:
    //     break;
    //   default:
    //     break;
    // }
  }

  Future<void> setSpmState(int state) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('spmState', state);
    notifyListeners();
  }

  Future<void> checkFirstSpm() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    firstSpmCheck = await prefs.getBool('firstSpm') ?? true;
    notifyListeners();
    if (firstSpmCheck = true) {
      setSpmState(0);
      await prefs.setBool('firstSpm', false);

      firstSpmCheck = (await prefs.getBool('firstSpm'))!;

      notifyListeners();
    }
  }

  Future<void> deviceSave(String deviceName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedDevice', deviceName);
  }

  Future<void> getSavedDivice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    savedDevice = await prefs.getString('savedDevice') ?? '';
    if (savedDevice == '') {
      setSpmState(1);
    }
    notifyListeners();
  }
}
