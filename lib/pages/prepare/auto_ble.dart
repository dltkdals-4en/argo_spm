import 'package:argo_spm/constants/constants.dart';
import 'package:argo_spm/providers/ble_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/prefs_provider.dart';
import '../home/home.dart';

class AutoBle extends StatelessWidget {
  const AutoBle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<PrefsProvider>(context);
    var ble = Provider.of<BleProvider>(context);
    print('autoBlePage');
    if (ble.bleConnected == false) {
      ble.connectBleAuto(prefs);
      return Container(
        color: AppColors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Home();
    }
  }
}
