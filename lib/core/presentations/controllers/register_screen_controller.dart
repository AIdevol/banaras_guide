import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController{
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController password2Controller;
  late TextEditingController addressController;

  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode password2FocusNode;

  bool obsecurePassword = true;
  bool obsecureConfirmPassword = true;
  bool isLoadingLocation = false;


  @override
  void onInit(){
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    password2Controller = TextEditingController();
    addressController = TextEditingController();

    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    password2FocusNode = FocusNode();

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