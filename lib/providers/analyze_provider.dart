import 'package:argo_spm/utils/db_helper.dart';
import 'package:flutter/material.dart';

class AnalyzeProvider with ChangeNotifier {
  List reportList = [];
  int soilType = 0;
  TextEditingController? areaText;
  int area = 0;

  Future<void> getReport() async {
    reportList = await DBHelper().getAllReports();
    notifyListeners();
  }
  Future<void> deleteAll() async {
    await DBHelper().deleteAllReports();
    getReport();
    notifyListeners();
  }
}
