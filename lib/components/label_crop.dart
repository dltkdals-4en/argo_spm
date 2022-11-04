import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../model/crop.dart';

class LabelCrops extends StatelessWidget {
  final String cropKey;

  const LabelCrops({
    Key? key,
    required this.cropKey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cropData = crops.where((item) => item.key == cropKey).toList();

    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.65,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 2.5,
              horizontal: 7.5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                colors: cropData[0].gradient,
                stops: [0, 1],
                begin: Alignment(1.00, -0.00),
                end: Alignment(-1.00, 0.00),
                // angle: 270,
                // scale: undefined,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x0c000000),
                  offset: Offset(0, 3),
                  blurRadius: 33,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                cropData[0].key.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
