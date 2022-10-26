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
  Future<bool> getFirstSpm() async{
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

  Future<void> deviceSave(String deviceName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedDevice', deviceName);
  }

  Future<void> getSavedDivice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    savedDevice = await prefs.getString('savedDevice') ?? '';
    if (savedDevice == '') {
      setSpmState(1);
    }else{
      setSpmState(2);
    }
    notifyListeners();
  }
  Future<bool> getFirstLogin() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool('firstLogin')??true;
  }
  Future<void> getLoginInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    savedId = await prefs.getString('savedId') ?? '';
    savedPw = await prefs.getString('savedPw') ?? '';
    if (savedId == '' || savedPw == '') {
      haveLoginInfo = false;
      notifyListeners();
    }else{
      haveLoginInfo = true;
    }
  }
}
