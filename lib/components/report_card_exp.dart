// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:agrodoctor/model/report_bak.dart';
// // import 'package:agrodoctor/utils/app_utils.dart';
//
// import '../routes/routes.dart';
// import 'report_card.dart';
//
// class ReportCardExp extends StatefulWidget {
//   final Report report;
//
//   const ReportCardExp({
//     Key key,
//     @required this.report,
//   }) : super(key: key);
//
//   @override
//   _ReportCardExpState createState() => _ReportCardExpState();
// }
//
// class _ReportCardExpState extends State<ReportCardExp> {
//   // int _isFavorite;
//
//   @override
//   void initState() {
//     super.initState();
//     // _isFavorite = widget.report.isFavorite;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print(widget.report.toString());
//         Navigator.of(context)
//             .pushNamed(Routes.reportDetails, arguments: widget.report);
//       },
//       child: Stack(
//         children: <Widget>[
//           ReportCard(
//             width: double.infinity,
//             height: 211,
//             imageHeight: 137,
//             report: widget.report,
//           ),
//           //todo 날씨 API 연동하여 기후 표시
//           // Positioned.directional(
//           //   textDirection:
//           //       AppUtils.isRTL(context) ? TextDirection.rtl : TextDirection.ltr,
//           //   end: 10,
//           //   top: 10,
//           //   child: RawMaterialButton(
//           //     onPressed: () {},
//           //     shape: CircleBorder(),
//           //     fillColor: Colors.white.withOpacity(0.7),
//           //     constraints: BoxConstraints.tightFor(
//           //       width: 55,
//           //       height: 55,
//           //     ),
//           //     child: Image.asset(
//           //       'assets/images/weather_${AppUtils.weatherConvert(widget.report.weatherID)}.png',
//           //       width: 40,
//           //       height: 40,
//           //     ),
//           //   ),
//           // ),
//           // Positioned.directional(
//           //   textDirection:
//           //       AppUtils.isRTL(context) ? TextDirection.rtl : TextDirection.ltr,
//           //   end: 15,
//           //   bottom: 55,
//           //   child: RawMaterialButton(
//           //     onPressed: () {
//           //       setState(() {
//           //         // _isFavorite = !_isFavorite;
//           //         // widget.report.isFavorite = _isFavorite;
//           //       });
//           //     },
//           //     shape: CircleBorder(),
//           //     fillColor: Colors.white,
//           //     constraints: BoxConstraints.tightFor(
//           //       width: 49,
//           //       height: 49,
//           //     ),
//           //     child: Image.asset(
//           //       // 'assets/images/icon_star_unselected.png',
//           //       widget.report.isFavorite > 0
//           //           ? 'assets/images/icon_star.png'
//           //           : 'assets/images/icon_star_unselected.png',
//           //       width: 25,
//           //       height: 25,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
