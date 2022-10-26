import 'package:argo_spm/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/prefs_provider.dart';
import '../home/home.dart';

class PreparePrefs extends StatelessWidget {
  const PreparePrefs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<PrefsProvider>(context);
    if (prefs.haveLoginInfo == false) {
      return LoginPage();
    } else {
      if (prefs.getFirstSpm() == true) {
        prefs.checkFirstSpm();
        return Container();
      } else {
        prefs.getSavedDivice();
        return Home();
      }
    }
  }
}
