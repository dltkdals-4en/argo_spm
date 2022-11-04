import 'package:flutter/material.dart';

import '../../../constants/constants.dart';



class SettingsItem extends StatelessWidget {
  final String title;
  final String subText;
  final VoidCallback onTap;
  final bool isMoveTo;

  const SettingsItem({
    Key? key,
    this.isMoveTo = false,
    this.subText = '',
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 21,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 17),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            _lastContentToggle(context),
          ],
        ),
      ),
    );
  }

  Widget _lastContentToggle(BuildContext context) {
    if (!isMoveTo) {
      return Text(
        subText,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 17),
      );
    }
    return Icon(
      Icons.arrow_forward_ios,
      color: AppColors.blueGray,
      size: 15,
    );
  }
}
