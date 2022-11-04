import 'dart:math';

import 'package:argo_spm/utils/db_helper.dart';
import 'package:flutter/material.dart';

import '../model/report_bak.dart';

class AnalyzeProvider with ChangeNotifier {
  List reportList = [];
  int soilType = 0;
  TextEditingController? areaText;
  int area = 0;

  Future<void> makeReport() async{
    getReport();
    if(reportList.isEmpty) {
      for (var i = 0; i < 5; i++) {
        Report inputReport = reports[Random().nextInt(reports.length)];
        await DBHelper().createData(inputReport);
      }
      getReport();
    }

  }
  Future<void> getReport() async {
    reportList = await DBHelper().getAllReports();
    notifyListeners();
  }
}
