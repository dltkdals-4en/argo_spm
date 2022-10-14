import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/crop.dart';
import '../../crop/widgets/crop_item_widget.dart';

class CropsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(crops.length);
    return Container(
      height: 200.sp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 18.sp, bottom: 34.sp, left: 23.sp, right: 23.sp),
        separatorBuilder: (context, index) => SizedBox(
          width: 15.sp,
        ),
        itemCount: crops.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CropItemWidget(
            crop: crops[index],
            onPressed: () {},
          );
        },
      ),
    );
  }
}
