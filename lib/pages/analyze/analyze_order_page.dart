import 'package:argo_spm/components/custom_button_widget.dart';
import 'package:argo_spm/pages/spm_screen/spm_screen.dart';
import 'package:argo_spm/providers/ble_provider.dart';
import 'package:argo_spm/providers/spm_provider.dart';
import 'package:charcode/html_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';
import '../../routes/routes.dart';
import '../../utils/app_utils.dart';

import 'dart:math';

class AnalyzeOrderPage extends StatefulWidget {
  final loadingWidget;
  final VoidCallback onPressed;

  const AnalyzeOrderPage(
      {Key? key, this.loadingWidget, required this.onPressed})
      : super(key: key);

  @override
  _AnalyzeOrderPageState createState() => _AnalyzeOrderPageState();
}

class AnalyzeOrderData {
  int soilType = 0;
  int soilArea = 0;
  String dataCrop = '';
  String element0 = '';
  String element1 = '';
  String element2 = '';
  String element3 = '';
  String element4 = '';
  String element5 = '';
  String element6 = '';
  String element7 = '';
}

// class _AnalyzeOrderPageState extends State<AnalyzeOrderPage>
//     with WidgetsBindingObserver {
class _AnalyzeOrderPageState extends State<AnalyzeOrderPage> {
  late VoidCallback _onPressed;
  int _currentStep = 0;

  // List<CameraDescription> _cameras;
  // CameraController _cameraController;

  static final TextEditingController _areaController = TextEditingController();
  static FocusScopeNode _currentFocus = FocusScopeNode();
  static AnalyzeOrderData saveData = AnalyzeOrderData();

  @override
  void initState() {
    super.initState();
    // setupCamera();
    // WidgetsBinding.instance.addObserver(this);
    _onPressed = widget.onPressed;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var spm = Provider.of<SpmProvider>(context);
    var ble = Provider.of<BleProvider>(context);
    return GestureDetector(
      onTap: () {
        _currentFocus = FocusScope.of(context);

        if (!_currentFocus.hasPrimaryFocus) {
          _currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('new_analyze'.tr()),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {

              },
              child: Text(
                'send'.tr(),
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ],
          // Row(
          //   children: <Widget>[
          //     // ignore: deprecated_member_use
          //     // ElevatedButton(
          //     //   onPressed: _onPressed,
          //     //   child: Text(
          //     //     'cancel'.tr(),
          //     //     style: Theme.of(context).textTheme.button,
          //     //   ),
          //     // ),
          //     Center(
          //       child: Text('new_analyze'.tr()),
          //     ),
          //     // ignore: deprecated_member_use
          //     ElevatedButton(
          //       onPressed: () {
          //         //DATA 기록
          //         // Report inputReport =
          //         //     reports[Random().nextInt(reports.length)];
          //         // DBHelper().createData(inputReport);
          //       },
          //       child: Text(
          //         'send'.tr(),
          //         style: Theme.of(context).textTheme.button,
          //       ),
          //     ),
          //   ],
          // ),
        ),
        body: SingleChildScrollView(
          child: Stepper(
            currentStep: _currentStep,
            physics: ClampingScrollPhysics(),
            // controlsBuilder: (context, details) {
            //   // if (_currentStep == 0) {
            //   //   return Row(
            //   //     children: [
            //   //       ElevatedButton(
            //   //         onPressed: details.onStepContinue,
            //   //         child: Text('next_step'.tr()),
            //   //       ),
            //   //     ],
            //   //   );
            //   // } else if (_currentStep == 4) {
            //   //   return Container();
            //   // } else {
            //   //   return Row(
            //   //     children: [
            //   //       ElevatedButton(
            //   //         onPressed: details.onStepContinue,
            //   //         child: Text('next_step'.tr()),
            //   //       ),
            //   //       SizedBox(
            //   //         width: 10,
            //   //       ),
            //   //       ElevatedButton(
            //   //         onPressed: details.onStepCancel,
            //   //         child: Text('before_step'.tr()),
            //   //       ),
            //   //     ],
            //   //   );
            //   // }
            // },
            onStepContinue: () {
              setState(
                () {
                  if (_currentStep == 1) {
                    if (!(_areaController.value.text.trim().toString().length >
                        1)) {
                      Fluttertoast.showToast(
                          msg: '재배 면적을 입력해주세요',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM);
                    } else {
                      if (!_currentFocus.hasPrimaryFocus) {
                        _currentFocus.unfocus();
                      }
                      _currentStep = _currentStep + 1;
                    }
                  } else if (_currentStep == 2) {
                    saveData.soilArea =
                        int.parse(_areaController.value.text.trim());
                    _currentStep = _currentStep + 1;
                  }
                  // else if (_currentStep == 3) {
                  //   _sendData();
                  // }
                  else if (_currentStep == 4) {
                    _sendData();
                  } else {
                    if (_currentStep < 4) {
                      _currentStep += 1;
                    } else {
                      _currentStep = 0;
                    }
                  }
                },
              );
            },
            onStepCancel: () {
              setState(() {
                if (_currentStep > 0) {
                  _currentStep -= 1;
                } else {
                  _currentStep = 0;
                }
              });
            },
            onStepTapped: (pos) {
              setState(() {
                _currentStep = pos;
              });
            },
            steps: <Step>[
              Step(
                isActive: _currentStep >= 0,
                state:
                    _currentStep > 0 ? StepState.complete : StepState.disabled,
                title: Text(
                  'Step 1. ' + 'analyze_step_1'.tr(),
                  style: Theme.of(context).textTheme.headline6,
                ),
                content: Column(
                  children: [
                    CustomRadioButton(
                      elevation: 0,
                      enableShape: true,
                      enableButtonWrap: true,
                      wrapAlignment: WrapAlignment.spaceEvenly,
                      absoluteZeroSpacing: false,
                      // autoWidth: true,
                      width: 173,
                      height: 40,
                      unSelectedColor: AppColors.white,
                      selectedColor: AppColors.primary,
                      selectedBorderColor: AppColors.darkGreen,
                      unSelectedBorderColor: AppColors.darkGreen,
                      buttonLables: [
                        'soil_type_0'.tr(),
                        'soil_type_1'.tr(),
                      ],
                      buttonValues: [
                        0,
                        1,
                      ],
                      defaultSelected: 0,
                      buttonTextStyle: ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      radioButtonValue: (value) {
                        saveData.soilType = int.parse(value.toString());
                      },
                    ),
                  ],
                ),
              ),
              Step(
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
                title: Text(
                  'Step 2. ' + 'analyze_step_2'.tr(),
                  style: Theme.of(context).textTheme.headline6,
                ),
                content: TextField(
                  controller: _areaController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'soil_area_place'.tr() +
                          String.fromCharCode($sup2) +
                          ')',
                      hintStyle: TextStyle(
                        color: AppColors.gray,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      suffixText: 'm' + String.fromCharCode($sup2)),
                ),
              ),
              Step(
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                  title: Text(
                    'Step 3. ' + 'analyze_step_3'.tr(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  content: Column(
                    children: [
                      // SectionTitleWidget(
                      //   title: 'analyze_step_3'.tr(),
                      //   count: 0,
                      //   onPressed: () {},
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomRadioButton(
                        elevation: 0,
                        enableShape: true,
                        enableButtonWrap: true,
                        wrapAlignment: WrapAlignment.spaceEvenly,
                        absoluteZeroSpacing: false,
                        width: 113,
                        height: 40,
                        unSelectedColor: AppColors.white,
                        selectedColor: AppColors.primary,
                        selectedBorderColor: AppColors.darkGreen,
                        unSelectedBorderColor: AppColors.darkGreen,
                        buttonLables: [
                          'crop_strawberry'.tr(),
                          'crop_lettuce'.tr(),
                          'crop_tomato'.tr(),
                          'crop_paddy'.tr(),
                          'crop_groundnut'.tr(),
                          'crop_sugarcane'.tr(),
                          'crop_corn'.tr(),
                          'crop_blackgram'.tr(),
                          'crop_greengram'.tr(),
                          'crop_onion'.tr(),
                          'crop_sesamum'.tr(),
                        ],
                        buttonValues: [
                          'crop_strawberry',
                          'crop_lettuce',
                          'crop_tomato',
                          'crop_paddy',
                          'crop_groundnut',
                          'crop_sugarcane',
                          'crop_corn',
                          'crop_blackgram',
                          'crop_greengram',
                          'crop_onion',
                          'crop_sesamum',
                        ],
                        defaultSelected: 'crop_strawberry',
                        buttonTextStyle: ButtonTextStyle(
                            selectedColor: Colors.white,
                            unSelectedColor: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        radioButtonValue: (value) {
                          if (value == null || value == '') {
                            saveData.dataCrop = 'crop_strawberry';
                          } else {
                            saveData.dataCrop = value.toString();
                          }
                        },
                      ),
                    ],
                  )),
              Step(
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled,
                  title: Text(
                    'Step 4. ' + 'analyze_step_4_1'.tr(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  content: Column(
                    children: [
                      CustomButtonWidget(
                        title: 'analyze_step_4_1'.tr(),
                        icon: Icons.lightbulb_rounded,
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.spm);
                        },
                      ),
                    ],
                  )),
              Step(
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 4 ? StepState.complete : StepState.disabled,
                title: Text(
                  'Step 5. ' + 'analyze_step_5'.tr(),
                  style: Theme.of(context).textTheme.headline6,
                ),
                content: Column(
                  children: [
                    CustomButtonWidget(
                      title: 'analyze_step_5'.tr(),
                      image: 'icon_measure',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            spm.setMeasuerListData();
                            return SpmScreen();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Step(
              //     isActive: _currentStep >= 0,
              //     state: _currentStep >= 5
              //         ? StepState.complete
              //         : StepState.disabled,
              //     title: Text(
              //       'Step 4-3. ' + 'analyze_step_4_3'.tr(),
              //       style: Theme.of(context).textTheme.headline6,
              //     ),
              //     content: CustomButtonWidget(
              //       title: 'analyze_step_4_3',
              //       icon: Icons.camera,
              //       onPressed: () {
              //         Navigator.of(context).pushNamed(Routes.spm);
              //       },
              //     )),
              // Step(
              //   isActive: _currentStep >= 0,
              //   state:
              //       _currentStep >= 6 ? StepState.complete : StepState.disabled,
              //   title: Text(
              //     'Step 4-4. ' + 'analyze_step_4_4'.tr(),
              //     style: Theme.of(context).textTheme.headline6,
              //   ),
              //   content: CustomButtonWidget(
              //     title: 'analyze_step_4_4',
              //     icon: Icons.camera,
              //     onPressed: () {
              //       Navigator.of(context).pushNamed(Routes.spm);
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future _sendData() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('입력 정보 확인'),
            //content: new Text("Hello World"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('재배시설 : ' + saveData.soilType.toString()),
                  Text('재배면적 : ' + saveData.soilArea.toString()),
                  Text('재배작물 : ' + saveData.dataCrop.tr()),
                ],
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              ElevatedButton(
                onPressed: () {
                  _initialData();
                  _onPressed();

                  // var _report = reports[0];

                  // Navigator.of(context)
                  //     .pushNamed(Routes.reportDetails, arguments: _report);
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  void _initialData() {
    Navigator.of(context).pop();
    _currentStep = 0;

    saveData.soilType = 0;
    saveData.soilArea = 0;
    saveData.dataCrop = '';
    _areaController.clear();
  }

// Future<void> setupCamera() async {
//   await [
//     Permission.camera,
//   ].request();
//   _cameras = await availableCameras();
//   var controller = await selectCamera();
//   setState(() => _cameraController = controller);
// }
//
// selectCamera() async {
//   var controller =
//       CameraController(_cameras[_selected], ResolutionPreset.low);
//   await controller.initialize();
//   return controller;
// }
//
// toggleCamera() async {
//   int newSelected = (_selected + 1) % _cameras.length;
//   _selected = newSelected;
//
//   var controller = await selectCamera();
//   setState(() => _cameraController = controller);
// }
}
