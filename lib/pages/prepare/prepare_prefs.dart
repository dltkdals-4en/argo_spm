import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/share_provider.dart';
import '../home/home.dart';

class PreparePrefs extends StatelessWidget {
  const PreparePrefs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<ShareProvider>(context);
    if (prefs.firstSpmCheck == true) {
      print('test1');
      prefs.checkFirstSpm();
      return Container();
    } else {
      prefs.getSavedDivice();
      return Home();
    }
  }
}
