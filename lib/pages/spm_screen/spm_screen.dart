import 'package:argo_spm/components/custom_button_widget.dart';
import 'package:argo_spm/constants/constants.dart';
import 'package:argo_spm/constants/screen_size.dart';
import 'package:argo_spm/pages/spm_screen/widgets/lamp_btn.dart';
import 'package:argo_spm/providers/spm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SpmScreen extends StatelessWidget {
  const SpmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spm = Provider.of<SpmProvider>(context);
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      title: Center(
        child: Text('${spm.dialogTitle}'),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size.width * 2 / 3,
            height: (size.width * 2 / 3) * 2 / 3,
            color: AppColors.darkGrey,
            child: Center(child: Text('시료 샘플 이미지 및 설명 문구(with webview)')),
          ),
          NorH,
          // CustomButtonWidget(
          //   onPressed: () {},
          //   title: 'lamp_state_on',
          //   icon: Icons.lightbulb,
          // ),
          // NorH,
          // CustomButtonWidget(onPressed: () {}, title: 'measure_all'), // CustomButtonWidget(
          //   onPressed: () {},
          //   title: 'lamp_state_on',
          //   icon: Icons.lightbulb,
          // ),
          // NorH,
          CustomButtonWidget(onPressed: () {}, title: 'measure_all'),
          NorH,
          // Table(
          //   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          //   border: TableBorder(
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   children: [
          //     TableRow(children: [
          //       TableCell(
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Text(
          //             '주요 성분',
          //             style: makeTextStyle(20, AppColors.black, 'bold'),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text(
          //           '측정 상태',
          //           style: makeTextStyle(20, AppColors.black, 'bold'),
          //         ),
          //       ),
          //       Container(),
          //     ], decoration: BoxDecoration()),
          //     TableRow(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Text(
          //             'OM',
          //             style: makeTextStyle(16, AppColors.black, 'bold'),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Text('측정 완료'),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: CustomButtonWidget(
          //               onPressed: () {}, title: 'measure_one'),
          //         ),
          //       ],
          //     ),
          //     TableRow(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Text('N'),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Text('측정 완료'),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: CustomButtonWidget(
          //               onPressed: () {}, title: 'measure_one'),
          //         ),
          //       ],
          //     ),
          //     TableRow(
          //       decoration: BoxDecoration(),
          //       children: [
          //         Padding(
          //           padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
          //           child: Text('P'),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Text('측정 완료'),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: CustomButtonWidget(
          //               onPressed: () {}, title: 'measure_one'),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              
            ),
            child: Text('다음 단계로'),
          ),
          CustomButtonWidget(onPressed: () {}, title: '다음 단계로')
        ],
      ),
    );
  }

  List<GridColumn> getColumns() {
    final textStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(255, 255, 255, 1));
    return <GridColumn>[
      GridColumn(
        columnName: 'elementName',
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            '주요 성분',
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'measureState',
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            '측정 상태',
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'measureBtn',
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Container(),
        ),
      ),
    ];
  }
}
