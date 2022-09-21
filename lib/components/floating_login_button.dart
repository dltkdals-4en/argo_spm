// import 'package:agrodoctor/routes/routes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../utils/constants.dart';
// import 'dart:math' as math;
//
// class FloatingLoginButton extends StatefulWidget {
//   final AnimationController parentController;
//
//   FloatingLoginButton({@required this.parentController});
//
//   @override
//   _FloatingLoginButtonState createState() => _FloatingLoginButtonState();
// }
//
// class _FloatingLoginButtonState extends State<FloatingLoginButton>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation<double> _scale;
//   Animation<double> _padding;
//   Animation<double> _opacity;
//
//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 250),
//     );
//
//     _scale = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
//         parent: widget.parentController,
//         curve: Interval(0, .5, curve: Curves.bounceOut)))
//       ..addListener(() {
//         setState(() {});
//       });
//
//     _padding = Tween<double>(begin: 0, end: 65).animate(CurvedAnimation(
//         parent: _controller, curve: Interval(0, 1, curve: Curves.easeIn)))
//       ..addListener(() {
//         setState(() {});
//       });
//
//     _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
//         parent: _controller, curve: Interval(0, .5, curve: Curves.easeIn)))
//       ..addListener(() {
//         setState(() {});
//       });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         _controller.value < .5
//             ? Container()
//             : Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 color:
//                     AppColors.black.withAlpha((150 * _opacity.value).round()),
//               ),
//         _buildSmallIcon(
//           -math.pi / 7,
//           FontAwesomeIcons.facebookF,
//           AppColors.blue,
//         ),
//         _buildSmallIcon(
//           math.pi / 7,
//           FontAwesomeIcons.google,
//           AppColors.googleRed,
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Transform.scale(
//             scale: _scale.value,
//             child: FloatingActionButton(
//               heroTag: 'signMenuBtn',
//               backgroundColor:
//                   _controller.value < .5 ? AppColors.green : AppColors.red,
//               onPressed: () {
//                 if (_controller.value == 0.0) {
//                   _controller.forward();
//                 } else {
//                   _controller.reverse();
//                 }
//               },
//               child: AnimatedIcon(
//                 icon: AnimatedIcons.menu_close,
//                 progress: _controller,
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   Align _buildSmallIcon(double angle, IconData icon, Color bgColor) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Transform.rotate(
//         angle: angle,
//         alignment: Alignment.bottomCenter,
//         child: Padding(
//           padding: EdgeInsets.only(bottom: _padding.value),
//           child: Transform.rotate(
//             angle: -angle,
//             child: Opacity(
//               opacity: _opacity.value,
//               child: FloatingActionButton(
//                 heroTag: 'btn${bgColor.toString()}',
//                 onPressed: () {
//                   if (icon == FontAwesomeIcons.google) {
//                     signInWithGoogle().then((value) => Navigator.of(context)
//                         .pushReplacementNamed(Routes.home));
//                   } else if (icon == FontAwesomeIcons.facebookF) {
//                     signInWithFacebook().then((value) => Navigator.of(context)
//                         .pushReplacementNamed(Routes.home));
//                   } else {
//                     AppInfos().setProvider('');
//                   }
//
//                   if (isDebugMode) {
//                     debugPrint('Sign In Provider = ${AppInfos.providerId}');
//                   }
//                 },
//                 elevation: 0,
//                 mini: true,
//                 backgroundColor: bgColor,
//                 child: Icon(
//                   icon,
//                   color: AppColors.white,
//                   size: 16,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<UserCredential> signInWithGoogle() async {
//     final googleUser = await GoogleSignIn().signIn();
//     final googleAuth = await googleUser.authentication;
//     final GoogleAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     AppInfos.providerId = AppProviderList.google;
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
//
//   Future<UserCredential> signInWithFacebook() async {
//     final result = await FacebookAuth.instance.login(
//       permissions: [
//         'public_profile',
//         'email',
//       ],
//     );
//     final FacebookAuthCredential facebookAuthCredential =
//         FacebookAuthProvider.credential(result.accessToken.toString());
//
//     AppInfos.providerId = AppProviderList.facebook;
//     return await FirebaseAuth.instance
//         .signInWithCredential(facebookAuthCredential);
//   }
// }
