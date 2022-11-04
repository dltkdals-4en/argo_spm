import 'package:argo_spm/constants/constants.dart';
import 'package:argo_spm/pages/spm_screen/widgets/spm_measure_row_widget.dart';
import 'package:argo_spm/providers/ble_provider.dart';
import 'package:argo_spm/providers/spm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../utils/app_utils.dart';

class SpmScreen extends StatelessWidget {
  const SpmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var spm = Provider.of<SpmProvider>(context);
    var size = MediaQuery.of(context).size;
    var ble = Provider.of<BleProvider>(context);
    return Stack(
      children: [
        AlertDialog(
          title: Center(
            child: Text('${spm.dialogIndex + 1}/3단계 측정하기'),
          ),

          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            spm.measureImage(),
                            fit: BoxFit.contain,
                          ),
                          width: size.width * 2 / 3,
                          height: (size.width * 2 / 3) * 2 / 3,
                        ),
                        SmH,
                        Text('이미지의 색상과 비슷한 색의 액상을 넣어주세요.')
                      ],
                    ),
                  ),
                ),
                NorH,
                // CustomButtonWidget(
                //   onPressed: () {},
                //   title: 'lamp_state_on',
                //   icon: Icons.lightbulb,
                // ),
                // NorH,
                // CustomButtonWidget(onPressed: () {}, title: 'measure_all'), // CustomButtonWidget(
                //   onPressed: () {},
                //   title: 'lamp_state_on',
                //   icon: Icons.lightbulb,
                // ),
                // NorH,
                SmH,
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.darkGreen),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 40,
                            width: size.width / 5,
                            child: Center(child: Text('주요 성분')),
                          ),
                          Container(
                            height: 40,
                            width: size.width / 5,
                            child: Center(child: Text('측정 상태')),
                          ),
                        ],
                      ),
                      Divider(),
                      SpmMeasureRowWIdget(
                        rowIndex: 0,
                      ),
                      SpmMeasureRowWIdget(
                        rowIndex: 1,
                      ),
                      SpmMeasureRowWIdget(
                        rowIndex: 2,
                      ),
                    ],
                  ),
                ),
                SmH,
                Container(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      spm.btnGesture(context, ble);
                      ble.sendMeasureData(spm.dialogIndex);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                        top: AppUtils.isRTL(context) ? 10 : 14,
                        bottom: AppUtils.isRTL(context) ? 8 : 10,
                        left: 5,
                        right: 5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text('${spm.nextBtnText}'),
                  ),
                ),

                // SpmTableWidget(),
              ],
            ),
          ),
          // actions: [
          //   ElevatedButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     style: ElevatedButton.styleFrom(
          //       padding: EdgeInsets.only(
          //         top: AppUtils.isRTL(context) ? 10 : 14,
          //         bottom: AppUtils.isRTL(context) ? 8 : 10,
          //         left: 5,
          //         right: 5,
          //       ),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(6),
          //       ),
          //       backgroundColor: AppColors.gray,
          //     ),
          //     child: Text('close_dialog'.tr()),
          //   ),
          //   ElevatedButton(
          //     onPressed: (spm.nextBtn) ? () {
          //       spm.btnNextMove();
          //     } : null,
          //     style: ElevatedButton.styleFrom(
          //       padding: EdgeInsets.only(
          //         top: AppUtils.isRTL(context) ? 10 : 14,
          //         bottom: AppUtils.isRTL(context) ? 8 : 10,
          //         left: 5,
          //         right: 5,
          //       ),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(6),
          //       ),
          //       backgroundColor: AppColors.primary,
          //     ),
          //     child: Text('${spm.nextBtnText}'),
          //   ),
          // ],
        ),
        Positioned(
          child: Visibility(
            visible: spm.isMeasured,
            child: Opacity(
              opacity: 0.7,
              alwaysIncludeSemantics: true,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(color: AppColors.gray),
              ),
            ),
          ),
        ),
        Positioned(
          child: Visibility(
            visible: spm.isMeasured,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitFadingCircle(
                  color: AppColors.primary,
                ),
                SmH,
                Text("측정중입니다."),
              ],
            ),
          ),
        )
      ],
    );
  }
}
