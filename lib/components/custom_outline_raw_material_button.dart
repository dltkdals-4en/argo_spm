// import 'package:flutter/material.dart';
//
// import '../data/pref_manager.dart';
// import '../utils/app_utils.dart';
// import '../utils/constants.dart';
//
// class CustomOutlineRawMaterialButton extends StatelessWidget {
//   final String title;
//   final Function onPressed;
//   final EdgeInsets padding;
//
//   const CustomOutlineRawMaterialButton({
//     Key key,
//     @required this.title,
//     @required this.onPressed,
//     this.padding,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var _isDark = Prefs.getBool(Prefs.DARKTHEME, def: false);
//     return RawMaterialButton(
//       onPressed: onPressed,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(6),
//         side: BorderSide(
//             color:
//                 _isDark ? Colors.white.withOpacity(0.87) : AppColors.blueGray,
//             width: 1),
//       ),
//       padding: padding ??
//           EdgeInsets.only(
//               top: AppUtils.isRTL(context) ? 10 : 14,
//               bottom: AppUtils.isRTL(context) ? 8 : 10),
//       child: Text(
//         title,
//         style: TextStyle(
//           color: _isDark ? Colors.white.withOpacity(0.87) : AppColors.blueGray,
//           fontSize: 15,
//           fontWeight: FontWeight.w400,
//           fontStyle: FontStyle.normal,
//         ),
//       ),
//     );
//   }
// }
