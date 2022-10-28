import 'package:argo_spm/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//todo 인증대비 google 로그인
import '../../constants/constants.dart';
import '../../components/main_clipper.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();
  var width, height;
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: height,
            color: AppColors.black,
            child: GestureDetector(
              onTap: () {
                //todo 인증 대비 google Sign으로 바로 이동
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => LoginPage()));
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: _signInButton(),
                ),
              ),
            ),
          ),
          Hero(
            tag: 'main-clipper',
            child: ClipPath(
              clipper: MainClipper(),
              child: Material(
                child: PageView(
                  controller: _pageController,
                  children: [
                    _buildContent(
                        'intro_story_0', 'intro_0_0'.tr(), 'intro_1_0'.tr()),
                    _buildContent(
                        'intro_story_1', 'intro_0_1'.tr(), 'intro_1_1'.tr()),
                    _buildContent(
                        'intro_story_2', 'intro_0_2'.tr(), 'intro_1_2'.tr())
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 140),
              child: SliderIndicator(
                  length: 3,
                  activeIndex: currentPage,
                  indicator: Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  activeIndicator: Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          color: AppColors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))))),
            ),
          )
        ],
      ),
    );
  }

  Widget _signInButton() {
    return OutlinedButton(
      onPressed: () {
       Navigator.of(context).pushNamed(Routes.login);
      },
      style: OutlinedButton.styleFrom(
        minimumSize: Size(200.0, 50.0),
        primary: Colors.black87,
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
            'login_6'.tr(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(img, title, text) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        AppColors.lightGreen,
        AppColors.green,
        AppColors.darkGreen
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      //todo 컬럼 overflow 해결 (현재 사이즈 조절로 임시)
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$img.png',
            width: width * .65,
            height: height * .3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 15),
            child: Text(title,
                textAlign: TextAlign.center, style: eTextStyleHeadline28),
          ),
          Text(text, textAlign: TextAlign.center, style: eTextStyleSubtitle14w),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

// Future<UserCredential> signInWithGoogle() async {
//   final googleUser = await GoogleSignIn().signIn();
//   final googleAuth = await googleUser.authentication;
//   final GoogleAuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );
//
//   AppInfos.providerId = AppProviderList.google;
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
}
