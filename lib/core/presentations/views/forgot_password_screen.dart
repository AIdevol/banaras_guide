import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/core/presentations/controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
        builder: (context) => Scaffold(
              backgroundColor: appcolor,
              appBar: AppBar(),
            ));
  }
}
