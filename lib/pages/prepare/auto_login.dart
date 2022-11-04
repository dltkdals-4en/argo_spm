import 'package:argo_spm/pages/login/login_page.dart';
import 'package:argo_spm/pages/prepare/state_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../providers/ble_provider.dart';
import '../../providers/login_provider.dart';
import '../../providers/prefs_provider.dart';
import '../home/home.dart';

class AutoLogin extends StatelessWidget {
  const AutoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var login = Provider.of<LoginProvider>(context);
    if (login.isSignIn == false) {
      login.autoSignIn();
      return Scaffold(
        body: Container(
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SpinKitFadingCircle(
                color: AppColors.primary,
              ),
              SmH,
              Text('로그인 중입니다.'),
            ],
          ),
        ),
      );
    } else {
      return StateCheck();
    }
    // if (prefs.haveLoginInfo == false) {
    //   return LoginPage();
    // } else {
    //   if (login.isSignIn == false) {
    //     login.signIn(prefs.savedId, prefs.savedPw);
    //     return Container(
    //       color: AppColors.white,
    //       child: Center(
    //         child: CircularProgressIndicator(
    //           color: AppColors.primary,
    //         ),
    //       ),
    //     );
    //   } else {
    //     return Home();
    //   }
    // }
  }
}
