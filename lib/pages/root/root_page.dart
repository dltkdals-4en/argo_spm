import 'package:argo_spm/pages/intro/intro_page.dart';
import 'package:argo_spm/pages/login/login_page.dart';
import 'package:argo_spm/pages/prepare/auto_login.dart';
import 'package:argo_spm/providers/permission_provider.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../providers/login_provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var permission = Provider.of<PermissionProvider>(context);
    var login = Provider.of<LoginProvider>(context);

      switch (login.loginHistory) {
        case 0:
          login.prepareUserInfo();
          return Container(
            color: Colors.white,
            child: Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
              ),
            ),
          );
        case 1:
          return IntroPage();
        case 2:
          return AutoLogin();
        default:
          return Container(color: Colors.white,
            child: Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
              ),
            ),);
      }




  }
}
