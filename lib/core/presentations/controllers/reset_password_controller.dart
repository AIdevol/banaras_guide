import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController{
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;

  late FocusNode passwordFocusNode;
  late FocusNode confirmpasswordFocusNode;
  bool obsecurePassword = true;
  bool obsecureConfirmPassword = true;

  @override
  void onInit(){
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();

    passwordFocusNode = FocusNode();
    confirmpasswordFocusNode = FocusNode();

    super.onInit();

  }

  @override
  void onClose(){
    passwordController.dispose();
    confirmpasswordController.dispose();

    passwordFocusNode.dispose();
    confirmpasswordFocusNode.dispose();

    super.onClose();
  }


  showOrHidePasswordVisibility() {
    obsecurePassword = !obsecurePassword;
    update();
  }

  showOrHideConfirmPasswordVisibility() {
    obsecureConfirmPassword = !obsecureConfirmPassword;
    update();
  }
}