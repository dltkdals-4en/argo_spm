import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsProvider with ChangeNotifier {
  bool firstSpmCheck = true;
  String savedDevice = '';
  bool checkBleConneted = false;
  int spmState = 0;
  bool stateCheck = false;
  bool haveLoginInfo = false;
  String savedId = '';
  String savedPw = '';

  Future<void> spmStateCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (spmState == 0) {
      spmState = await prefs.getInt('spmState') ?? 0;

      savedDevice = await prefs.getStringList('savedDevice')![0] ?? '';
      if (savedDevice == '') {
        setSpmState(1);
      } else {
        setSpmState(2);
      }
      print('spmStateCheck -> $spmState');
      notifyListeners();
    }
  }

  Future<void> setSpmState(int state) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('spmState', state);
    spmState = state;
    notifyListeners();
  }

  Future<bool> getFirstSpm() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool('firstSpm') ?? true;
  }

  Future<void> checkFirstSpm() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    firstSpmCheck = await prefs.getBool('firstSpm') ?? true;
    print('firstSpmCheck = $firstSpmCheck');
    notifyListeners();
    if (firstSpmCheck = true) {
      setSpmState(0);
      await prefs.setBool('firstSpm', false);
      firstSpmCheck = (await prefs.getBool('firstSpm'))!;
      notifyListeners();
    }
  }

  Future<void> deviceSave(String deviceName, String deviceAddress) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('savedDevice', [deviceName, deviceAddress]);
  }

  Future<void> getSavedDivice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    savedDevice = await prefs.getStringList('savedDevice')![0] ?? '';
    if (savedDevice == '') {
      setSpmState(1);
      notifyListeners();
    } else {
      setSpmState(2);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<bool> getFirstLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool('firstLogin') ?? true;
  }

  Future<void> getLoginInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    savedId = await prefs.getString('savedId') ?? '';
    savedPw = await prefs.getString('savedPw') ?? '';
    if (savedId == '' || savedPw == '') {
      haveLoginInfo = false;
      notifyListeners();
    } else {
      haveLoginInfo = true;
      notifyListeners();
    }
  }

  Future<void> saveEmailAndPw(String email, String pw) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedId', email);
    await prefs.setString('savedPw', pw);
    await prefs.setBool('firstLogin', false);
  }

  Future<void> initLoginInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedId', '');
    await prefs.setString('savedPw', '');
  }
}
