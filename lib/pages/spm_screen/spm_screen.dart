import 'package:argo_spm/components/custom_button_widget.dart';
import 'package:argo_spm/constants/constants.dart';
import 'package:argo_spm/constants/screen_size.dart';
import 'package:argo_spm/pages/spm_screen/widgets/lamp_btn.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SpmScreen extends StatelessWidget {
  const SpmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("분광센서 측정"),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(NORMALGAP),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 2 / 3,
                height: (size.width * 2 / 3) * 2 / 3,
                color: AppColors.darkGrey,
                child: Center(child: Text('분광기 이미지 ')),
              ),
              NorH,
              CustomButtonWidget(onPressed: (){}, title: 'lamp_state_on', icon: Icons.lightbulb,),
              NorH,
              CustomButtonWidget(onPressed: (){}, title: 'measure_all'),
              NorH,
              Padding(
                padding: const EdgeInsets.all(3),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  children: [

                    TableRow(
                      children: [
                        Text('OM', style: makeTextStyle(16, AppColors.black,'bold'),),
                        Text('측정 완료'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomButtonWidget(onPressed: (){}, title: 'measure_one'),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text('N'),
                        Text('측정 완료'),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomButtonWidget(onPressed: (){}, title: 'measure_one'),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(

                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
                          child: Text('P'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('측정 완료'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomButtonWidget(onPressed: (){}, title: 'measure_one'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SfDataGridTheme(
                data: SfDataGridThemeData(
                    headerHoverColor: Colors.white.withOpacity(0.3),
                    headerColor: AppColors.darkGreen),
                child: SfDataGrid(
                  source: ,
                  verticalScrollPhysics: NeverScrollableScrollPhysics(),
                  columnWidthMode: ColumnWidthMode.fill,
                  gridLinesVisibility: GridLinesVisibility.both,
                  columns: getColumns(),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('레포트 만들기'),
              ),
            ],
          ),
        ),
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
