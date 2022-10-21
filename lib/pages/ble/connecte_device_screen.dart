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
              title: Text('기기 키기'),
              content: Container(
                width: size.width * 2 / 3,
                height: 200,
                color: AppColors.gray,
                child: Center(child: Text('분광센서 전원 세팅 이미지')),
              ),
            ),
            Step(
              isActive: dc.currentStep >= 0,
              title: Text('기기 대기'),
              content: Container(
                child: Text('대기 상태 세팅 이미지'),
              ),
            ),
            Step(
              isActive: dc.currentStep >= 0,
              title: Text('기기 연결'),
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
