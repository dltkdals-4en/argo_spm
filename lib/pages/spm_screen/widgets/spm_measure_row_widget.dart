import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/disabled_button_widget.dart';
import '../../../constants/constants.dart';
import '../../../providers/spm_provider.dart';

class SpmMeasureRowWIdget extends StatelessWidget {
  const SpmMeasureRowWIdget({
    Key? key,
    required this.rowIndex,
  }) : super(key: key);

  final int rowIndex;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var spm = Provider.of<SpmProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: size.width / 5,
            height: 30,
            child: Center(
              child: Text('${spm.measureList[rowIndex].elementName}'),
            ),
          ),
          Container(
            width: size.width / 5,
            child: Center(
                child: Text(
                    (spm.measureList[rowIndex].measureState) ? '완료' : '준비 중')),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(right: 8),
          //     child: (!spm.measureList[rowIndex].measureState)
          //         ? DisabledButtonWidget(
          //             title: '${spm.measureList[rowIndex].measureBtn}',
          //           )
          //         : ElevatedButton(
          //             onPressed: () {},
          //             style: ElevatedButton.styleFrom(
          //               backgroundColor: AppColors.primary,
          //             ),
          //             child:
          //                 Center(child: Text('${spm.measureList[rowIndex].measureBtn}')),
          //           ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
