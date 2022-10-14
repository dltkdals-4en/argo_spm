import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SpmProvider with ChangeNotifier {
  List measureList = <MeasureList>[];
  bool isMeasured = false;
  int dialogIndex = 0;
  String dialogTitle = '1단계 측정하기';
  bool nextBtn = false;

  setMeasuerListData() {
    measureList.clear();
    measureList.add(MeasureList('OM', false, '측정 시작'));
    measureList.add(MeasureList('N', false, '측정 시작'));
    measureList.add(MeasureList('P', false, '측정 시작'));
    print(isMeasured);
    isMeasured = true;
    print(isMeasured);
    notifyListeners();
  }

  getMeasureList() {
    print(measureList.length);
    measureList
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell(
                  columnName: 'elementName', value: dataGridRow.elementName),
              DataGridCell(
                  columnName: 'measureState', value: dataGridRow.measureState),
              DataGridCell(
                  columnName: 'measureBtn', value: dataGridRow.measureBtn),
            ]))
        .toList(growable: true);
  }
}

class MeasureList {
  MeasureList(this.elementName, this.measureState, this.measureBtn);

  final String elementName;
  final bool measureState;
  final String measureBtn;
}
