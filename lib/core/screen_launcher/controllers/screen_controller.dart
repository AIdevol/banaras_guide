import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/local_keys.dart';
import 'package:guide_banaras/core/presentations/views/login_screen.dart';
import 'package:guide_banaras/main.dart';

class ScreenController extends GetxController {
  @override
  void onInit() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    _navigatetoNextScreenView();
    super.onInit();
  }

  _navigatetoNextScreenView() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (storage.read(isFirstTime) ?? true) {
        Get.offAndToNamed('/loginscreen');
      } else {
        Get.offAndToNamed('/homescreen');
      }
    });
    // Timer(const Duration(milliseconds: 1000), () {
    //   if (storage.read(isFirstTime) ?? true) {
    //     Get.offAndToNamed('/loginscreen');
    //   } else {
    //     Get.offAndToNamed('/homescreen');
    //   }
    // });
  }
}
