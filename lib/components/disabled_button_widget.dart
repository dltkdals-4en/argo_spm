import 'package:argo_spm/constants/constants.dart';
import 'package:flutter/material.dart';

class DisabledButtonWidget extends StatelessWidget {
  const DisabledButtonWidget({
    Key? key,
    this.btnSize,
    required this.title,
  }) : super(key: key);

  final Size? btnSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: null,
      child: Text('$title'),
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.darkGrey,
        fixedSize: (btnSize != null) ? btnSize : Size(size.width / 3, 30),
      ),
    );
  }
}
