import 'package:argo_spm/pages/ble/pairing_list_screen.dart';
import 'package:argo_spm/pages/prepare/prepare_prefs.dart';
import 'package:argo_spm/pages/spm_screen/spm_screen.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:flutter/material.dart';


import '../pages/home/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => PreparePrefs(),
        );
      case Routes.spm:
        return MaterialPageRoute(
          builder: (context) => SpmScreen(),
        );
      case Routes.pairing:
          return MaterialPageRoute(
            builder: (context) => ParingListScreen(),
          );
      default:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
    }
  }
}
