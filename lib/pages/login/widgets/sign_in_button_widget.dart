import 'package:argo_spm/providers/login_provider.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
    var size = MediaQuery.of(context).size;
    return OutlinedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          await login
              .signIn(login.email.text, login.pw.text)
              .then((value) async {
            if (login.isSignIn) {
              await prefs
                  .saveEmailAndPw(login.email.text, login.pw.text)
                  .then((value) {
                Navigator.of(context).pushNamed(Routes.home);
              });
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Center(child: Text('AgroDoctorSPM 고객 전용')),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    contentPadding: EdgeInsets.zero,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('-본 페이지는 AgroDoctorSPM 고객 전용입니다.'),
                                SmH,
                                Text(
                                    '-AgroDoctorSPM 고객인데 아이디/비밀번호를 모르시는 경우, 담당자에게 문의해주세요.'),
                                SmH,
                                Text(
                                    '-AgroDoctorSPM 고객이 아니시라면, 상담 문의를 신청해주세요.'),
                                NorH,
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteGrey,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('상담 문의',
                                    style: makeTextStyle(16, null, 'bold')),
                                SmH,
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '070-0000-0000',
                                        style:
                                            makeTextStyle(12, null, 'regular'),
                                      ),
                                      Container(
                                        height: 12,
                                        child: VerticalDivider(
                                          color: AppColors.red,
                                          thickness: 2,
                                        ),
                                      ),
                                      Text(
                                        'admin@4en.co.kr',
                                        style:
                                            makeTextStyle(12, null, 'regular'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
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
