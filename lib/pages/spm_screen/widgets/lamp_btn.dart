import 'package:argo_spm/constants/constants.dart';
import 'package:flutter/material.dart';

class LampBtn extends StatelessWidget {
  const LampBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.lightbulb),
      label: Text("전구 꺼짐", style: makeTextStyle(16, AppColors.white, 'regular'),),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(size.width / 4, 50),
      ),
    );
  }
}
