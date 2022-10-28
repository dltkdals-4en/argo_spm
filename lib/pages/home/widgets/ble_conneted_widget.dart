import 'package:argo_spm/constants/constants.dart';
import 'package:argo_spm/providers/ble_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BleConnectedWidget extends StatelessWidget {
  const BleConnectedWidget(
      {Key? key, required this.onTap, required this.image, this.size})
      : super(key: key);
  final VoidCallback onTap;
  final String image;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    var ble = Provider.of<BleProvider>(context);
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            child: Image.asset(
              'assets/images/$image.png',
              width: size?.width ?? 20,
              height: size?.height ?? 20,
            ),
          ),
          SmW,
          Text(
            (!ble.bleConnected)
                ? '기기 연결 안됨'
                : '${ble.deviceName}',
            style: makeTextStyle(16, AppColors.black, 'regular'),
          ),
        ],
      ),
    );
  }
}
