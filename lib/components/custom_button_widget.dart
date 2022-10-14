import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

import '../utils/app_utils.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    this.icon,
    this.image,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final String? image;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

      constraints: BoxConstraints(maxWidth: 300, minWidth: 200),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      fillColor: AppColors.primary,
      padding: EdgeInsets.only(
        top: AppUtils.isRTL(context) ? 10 : 14,
        bottom: AppUtils.isRTL(context) ? 8 : 10,
        left: 5,
        right: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget(),
          SizedBox(
            width: 5,
          ),
          Text(
            title.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  iconWidget() {
    if (image == null && icon == null) {
      return Container();
    } else if (image == null && icon != null) {
      return Icon(
        icon,
        color: Colors.white,
      );
    } else if (image != null && icon == null) {
      return ImageIcon(
        AssetImage('assets/images/$image.png',
        ),
        color: Colors.white,
      );
    }
  }
}
