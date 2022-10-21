import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/crop.dart';

class CropItemWidget extends StatelessWidget {
  final Crop crop;
  final VoidCallback onPressed;

  const CropItemWidget({
    Key? key,
    required this.crop,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/crops/${crop.key}_small.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Opacity(
            opacity: 0.65,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    crop.gradient[0],
                    crop.gradient[1],
                  ],
                  stops: [0, 1],
                  begin: Alignment(-0.00, -1.00),
                  end: Alignment(0.00, 1.00),
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
            ),
          ),
          Center(
            child: Text(
              crop.key.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
