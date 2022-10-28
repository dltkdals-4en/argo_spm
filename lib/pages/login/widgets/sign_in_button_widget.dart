import 'package:argo_spm/providers/login_provider.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget(this.formKey, {Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    var login = Provider.of<LoginProvider>(context);
    var prefs = Provider.of<PrefsProvider>(context);
    return OutlinedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          await login
              .signIn(login.email.text, login.pw.text)
              .then((value) async {
            await prefs
                .saveEmailAndPw(login.email.text, login.pw.text)
                .then((value) {
              Navigator.of(context).pushNamed(Routes.home);
            });
          });
        }
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.rightFromBracket,
            size: 20,
            color: AppColors.googleRed,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'login_3'.tr(),
          ),
        ],
      ),
    );
  }
}
