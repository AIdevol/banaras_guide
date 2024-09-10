import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController{
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool obsecurePassword = true;
  bool obsecureConfirmPassword = true;


  @override
  void onInit(){
   emailController = TextEditingController();
   passwordController = TextEditingController();

   emailFocusNode = FocusNode();
   passwordFocusNode = FocusNode();

   super.onInit();

  }

  @override
  void onClose(){
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

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