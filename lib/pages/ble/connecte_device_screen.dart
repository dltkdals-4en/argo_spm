import 'package:argo_spm/components/custom_button_widget.dart';
import 'package:argo_spm/constants/constants.dart';
import 'package:argo_spm/providers/dc_stepper_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.dart';

class ConnectDeviceScreen extends StatelessWidget {
  const ConnectDeviceScreen({Key? key, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var dc = Provider.of<DcStepperProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('connecting_device'.tr()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stepper(
          currentStep: dc.currentStep,
          onStepContinue: () {
            dc.stepContinue(onPressed);
          },
          onStepCancel: () {
            dc.stepCancle();
          },
          onStepTapped: (value) {
            dc.stepTapped(value);
          },
          physics: ClampingScrollPhysics(),
          steps: <Step>[
            Step(
              isActive: dc.currentStep >= 0,
              title: Text('기기전원 키기'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 2 / 3,
                    color: AppColors.white,
                    child: Image.asset(
                      'assets/images/sensor_power_on.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SmH,
                  Text(
                    '기기의 전원 버튼을 켜주세요',
                    style: makeTextStyle(16, null, 'regular'),
                  )
                ],
              ),
            ),
            Step(
              isActive: dc.currentStep >= 0,
              title: Text('연결 준비하기'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: size.width * 2 / 3,
                    height: 200,
                    color: AppColors.white,
                    child: Image.asset(
                      'assets/images/sensor_ble_on.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SmH,
                  Text(
                    '기기의 블루투스 버튼을 2초 정도 눌러주세요.\n(2초 후, pairing 표시창이 파란색으로 깜빡이는지 확인해주세요.)',
                    style: makeTextStyle(16, null, 'regular'),
                  )
                ],
              ),
            ),
            Step(
              isActive: dc.currentStep >= 0,
              title: Text('기기 연결하기'),
              content: Container(
                  child: CustomButtonWidget(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.pairing);
                },
                title: '기기 연결하기',
                image: 'ble_connected',
              )),
            ),
            // Step(
            //   title: Text('대기 상태 만들기'),
            //   content: Container(
            //     child: Text('대기 상태 세팅 이미지'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
