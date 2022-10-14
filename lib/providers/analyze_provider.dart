import 'package:flutter/material.dart';

class AnalyzeProvider with ChangeNotifier{
  List Report = [];
  int soilType = 0;
  TextEditingController? areaText;
  int area = 0;
}