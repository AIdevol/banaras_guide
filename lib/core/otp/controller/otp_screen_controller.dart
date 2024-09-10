import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController{
  late TextEditingController otpScreenController;
  bool enableResend = false;
  int secondsRemaining = 30;
  Timer? timer;



@override
  void onInit(){
  otpScreenController = TextEditingController();
  timer = Timer.periodic(const Duration(seconds: 1), (_) {
    if (secondsRemaining != 0) {
      secondsRemaining--;
      update();
    } else {
      enableResend = true;
      update();
    }
  });
}

  void resendCode() {
    secondsRemaining = 30;
    enableResend = false;
    update();
    // hitResendOtpAPI(email);
  }

}