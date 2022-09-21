// import 'package:flutter/material.dart';
//
// import '../model/report_bak.dart';
// import '../utils/constants.dart';
// import 'label_crop.dart';
//
// class ReportCardReview extends StatefulWidget {
//   final Report report;
//
//   const ReportCardReview({Key key, @required this.report}) : super(key: key);
//   @override
//   _ReportCardReviewState createState() => _ReportCardReviewState();
// }
//
// class _ReportCardReviewState extends State<ReportCardReview> {
//   String _image = 'icon_add';
//   bool _checked = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 261,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Color(0x1f000000),
//             offset: Offset(0, 3),
//             blurRadius: 33,
//             spreadRadius: 0,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             height: 186,
//             child: ClipRRect(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(8),
//                 topRight: Radius.circular(8),
//               ),
//               child: Image.asset(
//                 'assets/images/crops/${widget.report.cropKey}.jpg',
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 13,
//               ),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Text(
//                               widget.report.title,
//                               style: TextStyle(
//                                 color: Color(0xff3e3f68),
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700,
//                                 fontStyle: FontStyle.normal,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             LabelCrops(
//                               cropKey: widget.report.cropKey,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         Text(
//                           widget.report.address,
//                           style: TextStyle(
//                             color: AppColors.blueGray,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             fontStyle: FontStyle.normal,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       if (_checked) {
//                         _image = 'icon_add';
//                       } else {
//                         _image = 'icon_checkbox_green';
//                       }
//                       setState(() {
//                         _checked = !_checked;
//                       });
//                     },
//                     child: Image.asset(
//                       'assets/images/$_image.png',
//                       width: 34.5,
//                       height: 34.5,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
