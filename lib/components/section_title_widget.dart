// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// class SectionTitleWidget extends StatelessWidget {
//   final String title;
//   final int count;
//   final Function onPressed;
//   final EdgeInsetsGeometry padding;
//
//   const SectionTitleWidget({
//     Key key,
//     @required this.title,
//     @required this.count,
//     @required this.onPressed,
//     this.padding,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: padding ??
//           const EdgeInsets.only(
//             left: 23,
//             right: 8,
//           ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Text(
//               title,
//               style: Theme.of(context).textTheme.headline6,
//             ),
//           ),
//           if (count > 0)
//             // ignore: deprecated_member_use
//             FlatButton(
//               onPressed: onPressed,
//               child: Text(
//                 '${'see_all'.tr()} ($count)',
//                 style: TextStyle(
//                   color: Color(0xffbcbcbc),
//                   fontSize: 15,
//                   fontWeight: FontWeight.w400,
//                   fontStyle: FontStyle.normal,
//                 ),
//                 textAlign: TextAlign.right,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
