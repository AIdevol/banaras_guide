import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/constants/extensions/extention_validate.dart';
import 'package:guide_banaras/constants/images.dart';
import 'package:guide_banaras/core/presentations/controllers/register_screen_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';
import 'package:guide_banaras/utilities/helper_widgets.dart';
import 'package:guide_banaras/utilities/text_fields_decorative.dart';

class RegisterScreen extends GetView<RegisterScreenController> {
  const RegisterScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false, // Add this line

        body: MyAnnotatedRegion(
          child: GetBuilder<RegisterScreenController>(
            builder: (controller) => SafeArea(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _upperContainer(context),
                      _downContainer(context),
                    ],
                  ),
                  Positioned(
                      left: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.height * 0.01,
                      top: MediaQuery.of(context).size.height * 0.10,
                      child: _mainScreen(context))
                ],
              ),
            ),
          ),
        ));
  }

  _upperContainer(BuildContext context) {
    final containerSize = MediaQuery.of(context).size * 0.50;
    return Container(
      height: containerSize.height * 0.7,
      decoration: BoxDecoration(
          color: appcolor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
    );
  }

  _downContainer(BuildContext context) {
    final containerSize = MediaQuery.of(context).size * 0.50;
    return Container(
      height: containerSize.height * 0.7,
      decoration: BoxDecoration(
          color: appcolor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    );
  }

  _mainScreen(BuildContext context) {
    final containerSize = MediaQuery.of(context).size * 0.80;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          height: containerSize.height,
          width: containerSize.width,
          decoration: BoxDecoration(
              color: lightwh8$gray,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.2,
                    blurRadius: 0.03,
                    blurStyle: BlurStyle.outer)
              ]),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: _imageField(context:context),
              ),
              vGap(20),
              _nameViewField(context:context),
              vGap(20),
              _emailtextField(context:context),
              vGap(20),
              _passwordtextField(context: context),
              vGap(20),
              _password2textField(context: context),
              vGap(20),

              _genderView(context: context),
              vGap(20),
              _addresstextField(context: context),
              vGap(10),
              _buttonView(context: context)
            ],
          )),
    );
  }

  _imageField({required BuildContext context}) {
    final imageSize = MediaQuery.of(context).size * 1 / 2;
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        applogo,
        scale: 1,
        fit: BoxFit.contain,
      ),
    );
  }

  _emailtextField({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
        prefix: Icon(FeatherIcons.mail),
        hintText: 'Email'.tr,
        labletext: 'Email'.tr,
      ),
    );
  }

  _passwordtextField({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
        prefix: Icon(FeatherIcons.lock),
        hintText: 'Password'.tr,
        labletext: 'Password'.tr,
        controller: controller.passwordController,
        obsecureText: controller.obsecurePassword ,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.password2FocusNode);
        },
        validator: (value) {
          return value?.validatePassword();
        },
        suffix: IconButton(onPressed: (){
          controller.showOrHidePasswordVisibility();
        },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: controller.obsecurePassword
                ?const Icon(Icons.visibility_off, color: Colors.grey,):
            Icon(Icons.visibility, color: appcolor,)),
        focusNode: controller.passwordFocusNode,
      ),
    );
  }

  _buttonView({required BuildContext context}) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: appcolor,
              fixedSize: const Size(315, 30),
              padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Register',
              style: MontserratStyles.montserratMediumTextStyle(size: 20),
            )));
  }

  _nameViewField({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
        prefix: const Icon(FeatherIcons.user),
        hintText: 'Name'.tr,
        labletext: 'Name'.tr,
      ),
    );
  }

  _password2textField({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
          prefix: const Icon(FeatherIcons.lock),
        hintText: 'Confirm Password'.tr,
        labletext: 'Confirm Password'.tr,
        controller: controller.password2Controller,
        obsecureText: controller.obsecureConfirmPassword ,
        textInputType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.passwordFocusNode);
        },
        validator: (value) {
          return value?.validatePassword();
        },
          suffix: IconButton(
              onPressed: () {
                controller.showOrHideConfirmPasswordVisibility();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: controller.obsecureConfirmPassword
                  ? const Icon(
                Icons.visibility_off,
                color: Colors.grey,
              )
                  :  Icon(
                Icons.visibility,
                color: appcolor,
              )),
          focusNode: controller.password2FocusNode)
    );
  }

  _genderView({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Gender', style: MontserratStyles.montserratMediumTextStyle(color: Colors.black),),
          vGap(07),
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: lightwh8$gray,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: controller.selectedGender,
                  isExpanded: true,
                  hint: Text('Gender'.tr, style: MontserratStyles.montserratMediumTextStyle(color: Colors.grey)),
                  onChanged: (String? newValue) {
                    controller.setSelectedGender(newValue!);
                  },
                  items: controller.genderType.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // verticalDot(context) {
  //   return DropdownButton(
  //       elevation: 1,
  //       underline: const SizedBox(),
  //       borderRadius: BorderRadius.circular(12),
  //       padding: EdgeInsets.zero,
  //       value: controller.dropDownValue,
  //       isExpanded: true,
  //       icon: const Icon(Icons.keyboard_arrow_down),
  //       items: controller.genderType.map((String items) {
  //         return DropdownMenuItem(
  //           value: items,
  //           child: SizedBox(
  //               width: Get.width,
  //               child: Text(items, style: BalooStyles.baloonormalTextStyle())),
  //         );
  //       }).toList(),
  // onChanged: (String? newValue) {
  //   controller.dropDownValue = newValue ?? '';
  //   // storage.write(USERType, controller.dropDownValue);
  //   print("storage.read(userType)");
  //   print(storage.read(controller.dropDownValue));
  //   controller.update();
  // }
  // );
  _addresstextField({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
        prefix: Icon(FeatherIcons.mapPin),
        hintText: 'Address'.tr,
        labletext: 'Address'.tr,
      ),
    );
  }

  void _showGenderDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Gender',style: MontserratStyles.montserratMediumTextStyle(size: 20, color: Colors.black87),),
          content: Container(
            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.genderType.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(controller.genderType[index]),
                  onTap: () {
                    controller.setSelectedGender(controller.genderType[index]);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

