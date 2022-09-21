// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import '../data/pref_manager.dart';
// import '../routes/routes.dart';
// import '../utils/app_utils.dart';
//
// class SearchWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var _isDark = Prefs.getBool(Prefs.DARKTHEME, def: false);
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(_isDark ? 0.12 : 1),
//         borderRadius: BorderRadius.circular(6),
//         boxShadow: [
//           BoxShadow(
//               color: Color(0x0c000000),
//               offset: Offset(0, 10),
//               blurRadius: 33,
//               spreadRadius: 0),
//           BoxShadow(
//               color: Color(0x0c000000),
//               offset: Offset(0, -10),
//               blurRadius: 33,
//               spreadRadius: 0),
//         ],
//       ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: TextFormField(
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 prefixIcon: Image.asset('assets/images/icon_search_grey.png'),
//                 hintText: 'search'.tr(),
//                 hintStyle: TextStyle(
//                   color: Color(0xffbcbcbc),
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   fontStyle: FontStyle.normal,
//                 ),
//                 contentPadding: AppUtils.isRTL(context)
//                     ? EdgeInsets.fromLTRB(14, 15, 14, 12)
//                     : EdgeInsets.fromLTRB(18, 19, 18, 16),
//               ),
//             ),
//           ),
//           Material(
//             color: Colors.white.withOpacity(_isDark ? 0.12 : 1),
//             borderRadius: BorderRadius.circular(6),
//             child: InkWell(
//               borderRadius: BorderRadius.circular(6),
//               onTap: () {
//                 Navigator.of(context).pushNamed(Routes.filter);
//               },
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
//                 child: Center(
//                   child: Image.asset('assets/images/icon_filter.png'),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
