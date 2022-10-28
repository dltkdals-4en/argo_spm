import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstOpenCheck extends StatelessWidget {
  const FirstOpenCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prefs = Provider.of<PrefsProvider>(context);
    return Container();
  }
}
