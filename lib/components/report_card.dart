// import 'package:flutter/material.dart';
//
// import '../model/report_bak.dart';
// import '../routes/routes.dart';
// import '../utils/app_utils.dart';
// import '../utils/constants.dart';
// import 'label_crop.dart';
// import 'soil_type_text.dart';
// import 'score_text.dart';
//
// class ReportCard extends StatelessWidget {
//   final Report report;
//   final double width;
//   final double height;
//   final double imageHeight;
//   final bool showMore;
//   final Function onTapMore;
//
//   const ReportCard({
//     Key key,
//     @required this.report,
//     this.width,
//     this.height,
//     this.imageHeight,
//     this.showMore,
//     this.onTapMore,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context)
//             .pushNamed(Routes.reportDetails, arguments: report);
//       },
//       child: Container(
//         width: width ?? 302,
//         height: height ?? 235,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: Color(0x1f000000),
//               offset: Offset(0, 3),
//               blurRadius: 33,
//               spreadRadius: 0,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               height: imageHeight ?? 161,
//               child: Stack(
//                 children: <Widget>[
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(8),
//                       topRight: Radius.circular(8),
//                     ),
//                     child: Image.asset(
//                       'assets/images/crops/${report.cropKey}.jpg',
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 12, horizontal: 10),
//                     child: Column(
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Container(
//                               padding: EdgeInsets.symmetric(
//                                 vertical: 5,
//                                 horizontal: 9.5,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(2),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Color(0x29000000),
//                                     offset: Offset(0, 1),
//                                     blurRadius: 2,
//                                     spreadRadius: 0,
//                                   ),
//                                 ],
//                               ),
//                               child: SoilTypeText(
//                                 soilType: report.soilType,
//                                 soilArea: report.soilArea,
//                               ),
//                             ),
//                             Expanded(child: SizedBox()),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Row(
//                           children: <Widget>[
//                             Container(
//                               padding: EdgeInsets.symmetric(
//                                 vertical: 5,
//                                 horizontal: 9.5,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: report.score < 20
//                                     ? AppColors.oriRed
//                                     : Colors.white,
//                                 borderRadius: BorderRadius.circular(2),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Color(0x29000000),
//                                     offset: Offset(0, 1),
//                                     blurRadius: 2,
//                                     spreadRadius: 0,
//                                   ),
//                                 ],
//                               ),
//                               child: ScoreText(
//                                 score: report.score,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.only(
//                   left: AppUtils.isRTL(context) ? 0 : 13,
//                   right: AppUtils.isRTL(context) ? 13 : 0,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         Text(
//                           report.title,
//                           style: TextStyle(
//                             color: Color(0xff3e3f68),
//                             fontSize: 17,
//                             fontWeight: FontWeight.w700,
//                             fontStyle: FontStyle.normal,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         LabelCrops(
//                           cropKey: report.cropKey,
//                         ),
//                         Expanded(
//                           child: Container(),
//                         ),
//                         if (showMore != null && showMore == true)
//                           ClipOval(
//                             child: Material(
//                               color: Colors.white,
//                               child: InkWell(
//                                 onTap: onTapMore,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Icon(
//                                     Icons.more_vert,
//                                     color: Color(0xff707070),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                     if (showMore == null)
//                       SizedBox(
//                         height: 8,
//                       ),
//                     Text(
//                       report.address,
//                       style: TextStyle(
//                         color: AppColors.primaryDark,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         fontStyle: FontStyle.normal,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
