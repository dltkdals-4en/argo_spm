import 'package:argo_spm/pages/login/widgets/sign_in_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../providers/login_provider.dart';

class InputInfoWidget extends StatefulWidget {
  const InputInfoWidget({Key? key}) : super(key: key);

  @override
  State<InputInfoWidget> createState() => _InputInfoWidgetState();
}

class _InputInfoWidgetState extends State<InputInfoWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var login = Provider.of<LoginProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: size.height * .55 - 70),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('intro_2'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: AppColors.white)),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: login.email,
                cursorColor: AppColors.primary,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1,
                    ),
                  ),
                  focusColor: AppColors.primary,
                  filled: true,
                  fillColor: AppColors.white,
                  labelText: '이메일 주소를 입력해주세요',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.primary,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력해주세요.';
                  }
                  if (!RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value)) {
                    return '잘못된 이메일 형식입니다.';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  login.saveEmail(newValue);

                },
              ),
            ),
            BigH,
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: login.pw,
                obscureText: login.pwObscure,
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1,
                    ),
                  ),
                  focusColor: AppColors.primary,
                  filled: true,
                  fillColor: AppColors.white,
                  labelText: '비밀번호를 입력해주세요',
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                    color: AppColors.primary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      login.changePwObscure();
                    },
                    icon: const Icon(
                      Icons.remove_red_eye_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력해주세요.';
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  login.saveEmail(newValue);

                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: SignInButtonWidget(_formKey),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
