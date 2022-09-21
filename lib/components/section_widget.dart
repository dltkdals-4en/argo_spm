// import 'package:flutter/material.dart';
//
// import '../data/pref_manager.dart';
// import '../utils/constants.dart';
//
// class SectionWidget extends StatelessWidget {
//   final String title;
//
//   const SectionWidget({Key key, @required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         vertical: 17,
//         horizontal: 21,
//       ),
//       color: Prefs.getBool(Prefs.DARKTHEME, def: false)
//           ? Colors.white.withOpacity(0.12)
//           : AppColors.primary.withOpacity(0.05),
//       child: Text(
//         title,
//         style: TextStyle(
//           color: Prefs.getBool(Prefs.DARKTHEME, def: false)
//               ? Colors.white.withOpacity(0.87)
//               : Color(0xff222455).withOpacity(0.5),
//           fontSize: 15,
//           fontWeight: FontWeight.w600,
//           fontStyle: FontStyle.normal,
//         ),
//       ),
//     );
//   }
// }
