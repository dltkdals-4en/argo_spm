// import 'package:agrodoctor/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/constants.dart';

import '../../components/floating_login_button.dart';
import '../../components/main_clipper.dart';
// import 'widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  var width, height;
  late double bottom;
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _position;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0, .3, curve: Curves.fastOutSlowIn)))
      ..addListener(() {
        setState(() {});
      });
    _position = Tween<double>(begin: 60, end: 40).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0, .8, curve: Curves.fastOutSlowIn)))
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    bottom = MediaQuery.of(context).viewInsets.bottom * .7;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: height,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: [
                        _buildForm(height),
                        Hero(
                          tag: 'main-clipper',
                          child: ClipPath(
                            clipper: MainClipper(),
                            child: Container(
                              height: height * .5,
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.lightGreen,
                                    AppColors.green,
                                    AppColors.darkGreen
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 45),
                                child: Image.asset(
                                  'assets/images/intro_total.png',
                                  width: width * .8,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(_height) {
    return Padding(
      padding: EdgeInsets.only(top: _height * .55 - 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('intro_2'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: AppColors.white)),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: _signInButton(),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _signInButton() {
    return OutlinedButton(
      onPressed: () {
        print('Pressed');
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87, backgroundColor: Colors.white,
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

//todo Email 로그인 연동 시 구현 부분, Validator 필요
// Widget _buildForm(_height) {
//   return Padding(
//     padding: EdgeInsets.only(top: _height * .55 - 70),
//     child: Column(
//       children: [
//         Text('intro_2'.tr(),
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 20, color: AppColors.white)),
//         SizedBox(
//           height: 24,
//         ),
//         InputWidget(),
//         SizedBox(
//           height: 12,
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: MaterialButton(
//                 onPressed: () {
//                   Navigator.of(context).pushReplacementNamed(Routes.home);
//                 },
//                 color: AppColors.darkBlack,
//                 height: 50,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5))),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'login_3'.tr(),
//                       style: TextStyle(color: AppColors.white),
//                     ),
//                     SizedBox(
//                       width: 32,
//                     ),
//                     Icon(
//                       Icons.arrow_forward,
//                       size: 12,
//                       color: AppColors.white,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 12,
//             ),
//             Expanded(
//               child: MaterialButton(
//                   //비밀번호 찾기 버튼
//                   onPressed: () {
//                     Navigator.of(context).pushNamed(Routes.forgotPassword);
//                   },
//                   height: 50,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(5))),
//                   child: Text(
//                     'login_4'.tr(),
//                     style: TextStyle(
//                         color: AppColors.white,
//                         fontWeight: FontWeight.normal,
//                         fontStyle: FontStyle.normal),
//                   )),
//             ),
//           ],
//         )
//       ],
//     ),
//   );
// }
}
