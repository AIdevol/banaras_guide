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
  // late TextEditingController genderController;
  // String selectedGender = '';
  String? selectedGender;
  List<String> genderType = [
    "Female",
    "Male",
    "Others",
  ];


  @override
  void onInit(){
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    password2Controller = TextEditingController();
    addressController = TextEditingController();
    // genderController = TextEditingController();

    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    password2FocusNode = FocusNode();

    super.onInit();
  }

  @override
  void onClose(){
  emailController.dispose();
  // genderController.dispose();
  passwordController.dispose();
  emailFocusNode.dispose();
  passwordFocusNode.dispose();
  super.onClose();
  }

  // void setSelectedGender(String gender) {
  //   selectedGender = gender;
  //   genderController.text = gender;
  //   update();
  // }
  void setSelectedGender(String? gender) {
    selectedGender = gender;
    update();
  }
  showOrHidePasswordVisibility() {
    obsecurePassword = !obsecurePassword;
    update();
  }

  showOrHideConfirmPasswordVisibility() {
    obsecureConfirmPassword = !obsecureConfirmPassword;
    update();
  }


// ===========================================================Registerations APi=====================================

void hitregistrationApicall(){
    // Get.find
}
}