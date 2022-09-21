// import 'package:flutter/material.dart';
//
// class CustomBackground extends StatelessWidget {
//   final String image;
//
//   const CustomBackground({Key key, @required this.image}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Image.asset(
//           'assets/images/$image.png',
//           width: double.infinity,
//           height: double.infinity,
//           fit: BoxFit.cover,
//         ),
//         Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xff000000),
//                 Color(0xff080808),
//                 Color(0x692d2d2d),
//               ],
//               stops: [0, 0.18, 1],
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//               // angle: 0,
//               // scale: undefined,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
