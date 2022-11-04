import 'package:argo_spm/pages/ble/ble_screen.dart';
import 'package:argo_spm/pages/ble/get_pairing_devices.dart';
import 'package:argo_spm/pages/ble/pairing_list_screen.dart';
import 'package:argo_spm/pages/login/login_page.dart';
import 'package:argo_spm/pages/prepare/auto_login.dart';
import 'package:argo_spm/pages/root/root_page.dart';
import 'package:argo_spm/pages/spm_screen/spm_screen.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/report_bak.dart';
import '../pages/analyze/analyze_result_page.dart';
import '../pages/home/home.dart';
import '../pages/report/report_details_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (context) => RootPage(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
      case Routes.spm:
        return MaterialPageRoute(
          builder: (context) => SpmScreen(),
        );
      case Routes.pairing:
        return MaterialPageRoute(
          builder: (context) => GetPairingDevices(),
        );
      case Routes.bleScanning:
        return MaterialPageRoute(
          builder: (context) => BleScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case Routes.analyzeResult:
        return CupertinoPageRoute(builder: (_) => AnalyzeResultPage());
      // case Routes.preparePrefs:
      //   return MaterialPageRoute(
      //     builder: (context) => PreparePrefs(),
      //   );
      case Routes.reportDetails:
        if (args is Report) {
          return CupertinoPageRoute(
            builder: (_) => ReportDetailsPage(
              report: args,
            ),
          );
        }
        return _errorRoute();

      default:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
    }
  }
  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
