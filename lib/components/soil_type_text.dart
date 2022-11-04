import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:charcode/charcode.dart';

import '../utils/app_utils.dart';


class SoilTypeText extends StatelessWidget {
  final int soilType;
  final int soilArea;
  final double? textSize;
  final double? iconSize;
  final Color? color;
  const SoilTypeText({
    Key? key,
    required this.soilType,
    required this.soilArea,
    this.textSize,
    this.iconSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          'assets/images/icon_soil_type_${soilType.toString()}.png',
          width: 15,
          height: 15,
        ),
        SizedBox(
          width: 3.5,
        ),
        Text(
          'soil_type_${soilType.toString()}'.tr() +
              ' - ' +
              AppUtils.numberWithComma(soilArea) +
              'm' +
              String.fromCharCode($sup2),
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontSize: textSize ?? 15,
                fontWeight: FontWeight.w700,
                color: color ?? Theme.of(context).textTheme.headline6?.color,
              ),
        ),
      ],
    );
  }
}
