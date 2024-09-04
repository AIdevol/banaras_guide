import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/core/otp/controller/otp_screen_controller.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpScreenController>(() => OtpScreenController());
  }
}
