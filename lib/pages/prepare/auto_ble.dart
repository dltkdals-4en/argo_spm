import 'package:argo_spm/constants/constants.dart';
import 'package:argo_spm/providers/ble_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../providers/prefs_provider.dart';
import '../home/home.dart';

class AutoBle extends StatelessWidget {
  const AutoBle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<PrefsProvider>(context);
    var ble = Provider.of<BleProvider>(context);

    if (ble.bleConnected == false) {
      ble.connectBleAuto(prefs);
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
              Text('블루투스 연결 중입니다.'),
            ],
          ),
        ),
      );
    } else {
      return Home();
    }
  }
}