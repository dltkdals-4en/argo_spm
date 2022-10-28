import 'package:argo_spm/providers/ble_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SpmProvider with ChangeNotifier {
  List<MeasureList> measureList = [];
  bool isMeasured = false;
  int dialogIndex = 0;
  String dialogTitle = '1/3단계 측정하기';
  bool nextBtn = false;
  String nextBtnText = 'measure_one'.tr();
  bool measureComplete = false;
  setMeasuerListData() {
    if (measureList.isEmpty) {
      measureList.add(MeasureList('OM', false));
      measureList.add(MeasureList('N', false));
      measureList.add(MeasureList('P', false));

    }
  }

  void btnGesture(BuildContext context, BleProvider ble) {

     if (dialogIndex < 2) {
      isMeasured = true;
      notifyListeners();
      Future.delayed(Duration(seconds: 2)).then((value) {

        measureList[dialogIndex].setSate = true;
        dialogIndex++;
        dialogTitle = '${dialogIndex + 1}/3단계 측정하기';
        isMeasured = false;
        notifyListeners();
      });
    } else if (dialogIndex == 2) {
      isMeasured = true;
      notifyListeners();
      Future.delayed(Duration(seconds: 2)).then((value) {
        measureList[dialogIndex].setSate = true;
        nextBtnText = '측정 완료';
        dialogIndex = 3;
        isMeasured = false;
        notifyListeners();
      });
    } else if (dialogIndex == 3) {
      measureList.forEach((element) {
        element.setSate = false;
      });
      ble.changeLampState(ble.lampState);
      dialogIndex = 0;
      nextBtnText = 'measure_one'.tr();
      measureComplete =true;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void btnNextMove() {
    if (dialogIndex < 2) {
      notifyListeners();
    } else if (dialogIndex == 2) {
      notifyListeners();
    }
  }
}

class MeasureList {
  MeasureList(this.elementName, this.measureState);

  final String elementName;
  bool measureState;

  bool get setSate => measureState;

  set setSate(bool state) {
    measureState = state;
  }
}
