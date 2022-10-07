import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareProvider with ChangeNotifier {
  bool firstSpmCheck = false;
  Future<void> checkFirstSpm() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('firstSpm') == false) {
      await prefs.setBool('firstSpm', true);
      notifyListeners();
    }
  }
}
