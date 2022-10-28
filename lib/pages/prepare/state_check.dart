import 'package:argo_spm/pages/prepare/auto_ble.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../providers/ble_provider.dart';
import '../home/home.dart';

class StateCheck extends StatelessWidget {
  const StateCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<PrefsProvider>(context);
    switch (prefs.spmState) {
      case 0:
        prefs.spmStateCheck();
        return Container();
      case 1:
        return Home();
      case 2:
        return AutoBle();
      default:
        return Container();
    }

    // if (prefs.getFirstSpm() == true) {
    //   prefs.checkFirstSpm();
    //   return Container(
    //     color: AppColors.white,
    //     child: Center(
    //       child: CircularProgressIndicator(
    //         color: AppColors.primary,
    //       ),
    //     ),
    //   );
    // } else {
    //   prefs.getSavedDivice();
    //   if (prefs.spmState == 2) {
    //     ble.connectBleAuto(prefs);
    //     if (ble.bleConnected == true) {
    //       return Home();
    //     } else if (prefs.spmState == 1) {
    //       return Home();
    //     } else {
    //       return Container(
    //         color: AppColors.white,
    //         child: Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.primary,
    //           ),
    //         ),
    //       );
    //     }
    //   } else {
    //     return Home();
    //   }
    // }
  }
}
