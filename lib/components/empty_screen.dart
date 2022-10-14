import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class EmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: width,
          height: 200,
          child: Image.asset(
            'assets/images/empty_screen.jpg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Text('empty_screen_title'.tr(),
              textAlign: TextAlign.center, style: eTextStyleHeadline20),
        ),
        Text('empty_screen_sub'.tr(),
            textAlign: TextAlign.center, style: eTextStyleSubtitle14),
      ],
    );
  }
}
