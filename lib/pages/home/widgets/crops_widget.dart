import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/crop.dart';
import '../../crop/widgets/crop_item_widget.dart';

class CropsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: 152,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 18, bottom: 34, left: 23, right: 23),
        separatorBuilder: (context, index) => SizedBox(
          width: 15,
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
