import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../components/section_widget.dart';
import '../../constants/constants.dart';
import '../../routes/routes.dart';
import 'widgets/settings_item.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  User? _user;
  int _tapCrashCount = 0;

  // Future<void> _launched;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  // final FacebookLogin facebookLogIn = FacebookLogin();

  // final bool _isDark = Prefs.getBool(Prefs.DARKTHEME, def: false);

  Future<void> _launchInBrowser(String url) async {
    // if (await canLaunch(url)) {
    //   await launch(
    //     url,
    //     forceSafariVC: false,
    //     forceWebView: false,
    //     headers: <String, String>{'my_header_key': 'my_header_value'},
    //   );
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SectionWidget(
              title: 'account'.tr(),
            ),
            SettingsItem(
              isMoveTo: false,
              title: 'account_info'.tr(),
              subText: _user != null ? _user!.email! : 'contact@4en.co.kr',
              onTap: () {},
            ),
            // if (AppInfos.providerId == AppProviderList.email) ...[
            //   Divider(
            //     color: Color(0xffbac0cb).withOpacity(0.21),
            //     height: 0.5,
            //     thickness: 0.5,
            //   ),
            //   SettingsItem(
            //     title: 'change_password'.tr(),
            //     onTap: () {
            //       Navigator.of(context).pushNamed(Routes.changePassword);
            //     },
            //   ),
            // ],
            InkWell(
              onTap: () {
                // showConfirmDialog(
                //   context: context,
                //   message: 'are_you_sure_you_want_to_logout'.tr(),
                //   action1: 'no'.tr(),
                //   action2: 'yes'.tr(),
                //   onPressed: () {
                //     FirebaseAuth.instance.signOut();
                //     if (AppInfos.providerId == AppProviderList.google) {
                //       debugPrint('google signout');
                //       _googleSignIn.signOut().then((value) =>
                //           Navigator.of(context)
                //               .pushReplacementNamed(Routes.intro));
                //     } else if (AppInfos.providerId ==
                //         AppProviderList.facebook) {
                //       debugPrint('Facebook signout');
                //       FacebookAuth.instance.logOut().then((value) =>
                //           Navigator.of(context)
                //               .pushReplacementNamed(Routes.intro));
                //     } else {
                //       debugPrint('general signout');
                //       Navigator.of(context).pushReplacementNamed(Routes.intro);
                //     }
                //
                //     AppInfos().setProvider(AppProviderList.empty);
                //
                //     // Navigator.popUntil(
                //     //     context, ModalRoute.withName(Routes.intro));
                //   },
                // );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: 17,
                  horizontal: 21,
                ),
                child: Text(
                  'logout'.tr(),
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            // Divider( //인증 : 언어 변경 OFF
            //   color: Color(0xffbac0cb).withOpacity(0.21),
            //   height: 0.5,
            //   thickness: 0.5,
            // ),
            // SettingsItem(
            //   title: 'change_language'.tr(),
            //   onTap: () {
            //     Navigator.of(context).pushNamed(Routes.changeLanguage);
            //   },
            // ),
            SectionWidget(
              title: 'service_info'.tr(),
            ),
            SettingsItem(
              title: 'terms_and_conditions'.tr(),
              onTap: () {
                // _launched = _launchInBrowser(fourenExternalLink.terms);
              },
            ),
            Divider(
              color: Color(0xffbac0cb).withOpacity(0.21),
              height: 0.5,
              thickness: 0.5,
            ),
            SettingsItem(
              title: 'privacy_policy'.tr(),
              onTap: () {
                // _launched = _launchInBrowser(fourenExternalLink.privacy);
              },
            ),
            SectionWidget(
              title: 'others'.tr(),
            ),
            SettingsItem(
              isMoveTo: false,
              title: 'versions'.tr(),
              subText: '1.0.0',
              onTap: () {
                // _launched = _launchInBrowser(fourenExternalLink.googlePlayUrl);
              },
            ),
            Divider(
              color: Color(0xffbac0cb).withOpacity(0.21),
              height: 0.5,
              thickness: 0.5,
            ),
            SettingsItem(
              title: 'user_guide'.tr(),
              onTap: () {
                // _launched = _launchInBrowser(fourenExternalLink.manual);
              },
            ),
            Divider(
              color: Color(0xffbac0cb).withOpacity(0.21),
              height: 0.5,
              thickness: 0.5,
            ),
            // SwitchListTile( //인증 - 테마 변경 Off
            //   value: _isDark,
            //   onChanged: (_) {
            //     setState(() {
            //       _isDark = !_isDark;
            //       Prefs.setBool(Prefs.DARKTHEME, _isDark);
            //       context.read<ThemeBloc>().add(ThemeChanged(
            //           theme:
            //               _isDark ? AppTheme.DarkTheme : AppTheme.LightTheme));
            //     });
            //   },
            //   title: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5),
            //     child: Text(
            //       'dark_theme'.tr(),
            //       style: Theme.of(context)
            //           .textTheme
            //           .headline6
            //           .copyWith(fontSize: 17),
            //     ),
            //   ),
            // ),
            SectionWidget(
              title: 'company_info'.tr(),
            ),
            SettingsItem(
              isMoveTo: false,
              title: 'company_name'.tr(),
              subText: '(주)포이엔',
              onTap: () {
                //인증 Debug 관련 - CrashReport 발행
                _tapCrashCount++;

                if (_tapCrashCount > 9) {
                  //TO-DO Crash 발생
                  // FirebaseCrashlytics.instance.crash();
                  _tapCrashCount = 0;
                }
              },
            ),
            Divider(
              color: Color(0xffbac0cb).withOpacity(0.21),
              height: 0.5,
              thickness: 0.5,
            ),
            SettingsItem(
              isMoveTo: false,
              title: 'company_homepage'.tr(),
              subText: fourenExternalLink.homepage,
              onTap: () {
                // _launched = _launchInBrowser(fourenExternalLink.homepage);
              },
            ),

            Divider(
              color: Color(0xffbac0cb).withOpacity(0.21),
              height: 0.5,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
