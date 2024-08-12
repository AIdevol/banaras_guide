import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/constants/images.dart';
import 'package:guide_banaras/core/screen_launcher/controllers/screen_controller.dart';

class ScreenLauncher extends GetView<ScreenController> {
  const ScreenLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor,
      body: GetBuilder<ScreenController>(
        builder: (controller) => Container(
          height: Get.height,
          width: Get.width,
          alignment: Alignment.center,
          child: Image.asset(
            appicon,
            height: Get.height,
            width: Get.width,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
