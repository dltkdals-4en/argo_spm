import 'package:argo_spm/pages/intro/intro_page.dart';
import 'package:argo_spm/pages/login/login_page.dart';
import 'package:argo_spm/pages/prepare/auto_login.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var login = Provider.of<LoginProvider>(context);
    print('root');
    switch (login.prepareUserInfo()) {
      case 0:
        return Container(
          color: Colors.red,
        );
      case 1:
        return IntroPage();
      case 2:
        return AutoLogin();
      default:
        return Container();
    }
  }
}
