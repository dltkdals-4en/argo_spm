import 'package:flutter/cupertino.dart';

class DcStepperProvider with ChangeNotifier {
  int currentStep = 0;

  void stepContinue(VoidCallback onPressed) {
    if (currentStep < 2) {
      currentStep++;
      notifyListeners();
    }else if(currentStep == 2){

      onPressed();
      notifyListeners();
    }
  }

  void stepCancle() {
    if (currentStep > 0) {
      currentStep -= 1;
    } else {
      currentStep = 0;
    }
    notifyListeners();
  }

  void stepTapped(int value) {
    currentStep = value;
    notifyListeners();
  }
}
