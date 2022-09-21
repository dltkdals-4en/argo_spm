// import 'package:flutter/material.dart';
//
// import '../utils/app_utils.dart';
// import '../utils/constants.dart';
//
// class CustomTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final String prefixIcon;
//   final Color prefixIconColor;
//   final String hintText;
//   final bool obscureText;
//
//   const CustomTextFormField({
//     Key key,
//     this.controller,
//     @required this.prefixIcon,
//     this.prefixIconColor,
//     @required this.hintText,
//     this.obscureText,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Color(0xffe8e8e8), width: 1),
//         boxShadow: [
//           BoxShadow(
//               color: Color(0x0c000000),
//               offset: Offset(0, 10),
//               blurRadius: 33,
//               spreadRadius: 0),
//         ],
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
//           hintStyle: TextStyle(
//             color: Color(0xffbcbcbc),
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             fontStyle: FontStyle.normal,
//           ),
//           contentPadding: AppUtils.isRTL(context)
//               ? EdgeInsets.fromLTRB(14, 15, 14, 12)
//               : EdgeInsets.fromLTRB(18, 19, 18, 16),
//         ),
//         style: Theme.of(context)
//             .textTheme
//             .subtitle1
//             .copyWith(color: AppColors.primaryDark),
//       ),
//     );
//   }
// }
