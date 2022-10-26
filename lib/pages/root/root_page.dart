import 'package:argo_spm/pages/login/login_page.dart';
import 'package:argo_spm/pages/prepare/prepare_prefs.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<PrefsProvider>(context);
    if(prefs.getFirstLogin()==true){
      return LoginPage();
    }else {
      prefs.getLoginInfo();
      return PreparePrefs();
    }
  }
}
