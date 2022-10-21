import 'package:argo_spm/pages/ble/connecte_device_screen.dart';
import 'package:argo_spm/pages/ble/sensor_explain_screen.dart';
import 'package:argo_spm/providers/ble_provider.dart';
import 'package:argo_spm/providers/share_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrepareBle extends StatelessWidget {
  const PrepareBle({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    var ble = Provider.of<BleProvider>(context);
    var prefs = Provider.of<ShareProvider>(context);
    switch (prefs.spmState) {
      case 0:
        return ConnectDeviceScreen(onPressed: onPressed,);
      case 1:
        return Container();
      default:
        print('default');
        return Container();
    }
  }
}
