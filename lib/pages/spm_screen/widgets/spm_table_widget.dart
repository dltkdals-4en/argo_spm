import 'package:flutter/material.dart';

import '../../../components/custom_button_widget.dart';
import '../../../constants/constants.dart';

class SpmTableWidget extends StatelessWidget {
  const SpmTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Row(
            children: [
              Container(
                height: 20,
                width: size.width / 5,
                child: Center(child: Text('주요 성분')),
              ),
              Container(
                height: 40,
                width: size.width / 5,
                child: Center(child: Text('측정 상태')),
              ),
            ],
          );
        } else if (index == 1) {
          return Divider();
        } else {
          return Row(
            children: [
              Container(
                width: size.width / 5,
                child: Center(child: Text('OM')),
              ),
              Container(
                width: size.width / 5,
                child: Center(child: Text('완료')),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: Center(child: Text("재측정")),
                ),
              ),
            ],
          );
        }
      },
    );
    // Table(
    //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    //     border: TableBorder(
    //       borderRadius: BorderRadius.circular(5),
    //     ),
    //     children: [
    //       TableRow(children: [
    //         TableCell(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(
    //               '주요 성분',
    //               style: makeTextStyle(16, AppColors.black, 'bold'),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text(
    //             '측정 상태',
    //             style: makeTextStyle(16, AppColors.black, 'bold'),
    //           ),
    //         ),
    //         Container(),
    //       ], decoration: BoxDecoration()),
    //       TableRow(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(
    //               'OM',
    //               style: makeTextStyle(16, AppColors.black, 'bold'),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text('완료'),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: CustomButtonWidget(
    //                 onPressed: () {}, title: 'measure_one'),
    //           ),
    //         ],
    //       ),
    //       TableRow(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text('N'),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text('완료'),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: CustomButtonWidget(
    //                 onPressed: () {}, title: 'measure_one'),
    //           ),
    //         ],
    //       ),
    //       TableRow(
    //         decoration: BoxDecoration(),
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
    //             child: Text('P'),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text('완료'),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: CustomButtonWidget(
    //                 onPressed: () {}, title: 'measure_one'),
    //           ),
    //         ],
    //       ),
    //     ],
    //   );
  }
}
