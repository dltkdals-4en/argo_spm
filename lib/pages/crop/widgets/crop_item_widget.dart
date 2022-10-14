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
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/crops/bg_${crop.key}.jpg',
            width: 120.sp,
            height: 120.sp,
            fit: BoxFit.fill,
          ),
        ),
        RawMaterialButton(
          constraints: BoxConstraints(maxHeight: 120.sp, maxWidth: 120.sp),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(0),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  crop.gradient[0].withOpacity(0.65),
                  crop.gradient[1].withOpacity(0.65),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Container(
              height: 120.sp,
              alignment: Alignment.center,
              child: Text(
                crop.key.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
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
