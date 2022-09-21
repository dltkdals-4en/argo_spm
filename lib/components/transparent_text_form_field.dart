// import 'package:flutter/material.dart';
// import 'package:agrodoctor/utils/app_utils.dart';
//
// class TransparentTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final String prefixIcon;
//   final Color prefixIconColor;
//   final String hintText;
//   final bool obscureText;
//
//   const TransparentTextFormField({
//     Key key,
//     this.controller,
//     @required this.prefixIcon,
//     this.prefixIconColor,
//     @required this.hintText,
//     this.obscureText,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final eTextStyle = TextStyle(
//       color: Colors.white,
//       fontSize: 17,
//       fontWeight: FontWeight.w400,
//       fontStyle: FontStyle.normal,
//     );
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.22),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText ?? false,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           prefixIcon: Image.asset(
//             'assets/images/$prefixIcon.png',
//             color: prefixIconColor,
//             width: 20,
//             height: 20,
//           ),
//           hintText: hintText,
//           hintStyle: eTextStyle,
//           contentPadding: AppUtils.isRTL(context)
//               ? EdgeInsets.fromLTRB(14, 15, 14, 12)
//               : EdgeInsets.fromLTRB(18, 19, 18, 16),
//         ),
//         style: eTextStyle,
//       ),
//     );
//   }
// }
