// import 'package:flutter/material.dart';
//
// import '../utils/app_utils.dart';
// import '../utils/constants.dart';
//
// class CustomRawMaterialButton extends StatelessWidget {
//   final String title;
//   final Function onPressed;
//   final double fontSize;
//   final EdgeInsets padding;
//   final double borderRadius;
//
//   const CustomRawMaterialButton({
//     Key key,
//     @required this.title,
//     @required this.onPressed,
//     this.fontSize,
//     this.padding,
//     this.borderRadius,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(borderRadius ?? 6),
//       ),
//       fillColor: AppColors.primary,
//       padding: padding ??
//           EdgeInsets.only(
//             top: AppUtils.isRTL(context) ? 10 : 14,
//             bottom: AppUtils.isRTL(context) ? 8 : 10,
//             left: 5,
//             right: 5,
//           ),
//       child: Text(
//         title,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: fontSize ?? 15,
//           fontWeight: FontWeight.w400,
//           fontStyle: FontStyle.normal,
//         ),
//         maxLines: 1,
//         overflow: TextOverflow.ellipsis,
//       ),
//     );
//   }
// }
