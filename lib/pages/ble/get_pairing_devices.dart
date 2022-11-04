import 'package:argo_spm/pages/ble/pairing_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../providers/ble_provider.dart';

class GetPairingDevices extends StatelessWidget {
  const GetPairingDevices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ble = Provider.of<BleProvider>(context);
    if (ble.getPairingDevices == false) {
      ble.getPairingList();

      return Container(
        color: Colors.white,
        child: Center(
          child:  SpinKitFadingCircle(
            color: AppColors.primary,
          ),
        ),
      );
    } else {
      return PairingListScreen();
    }
  }
}
