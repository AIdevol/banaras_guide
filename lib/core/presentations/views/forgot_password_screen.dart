import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/constants/extensions/extention_validate.dart';
import 'package:guide_banaras/constants/images.dart';
import 'package:guide_banaras/constants/navigation.dart';
import 'package:guide_banaras/core/presentations/controllers/forgot_password_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';
import 'package:guide_banaras/utilities/helper_widgets.dart';
import 'package:guide_banaras/utilities/text_fields_decorative.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false, // Add this line

        body: MyAnnotatedRegion(
          child: GetBuilder<ForgotPasswordController>(
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
                      top: MediaQuery.of(context).size.height * 0.20,
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
    final containerSize = MediaQuery.of(context).size * 0.50;
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
                child: _imageField(context),
              ),
              vGap(10),
              Center(
                child: Text(
                  'Forgot Password',
                  style: MontserratStyles.montserratSemiBoldTextStyle(
                      size: 18, color: Colors.blueGrey),
                ),
              ),
              vGap(20),
              _emailtextField(context),
              vGap(40),
              _buttonView(context)
            ],
          )),
    );
  }

  _imageField(BuildContext context) {
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

  _emailtextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
        hintText: 'Email'.tr,
        labletext: 'Email'.tr,
      ),
    );
  }

  _passwordtextField(BuildContext cotnext) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
        hintText: 'Password'.tr,
        labletext: 'Password'.tr,
        // obsecureText: ,
        validator: (value) {
          return value?.validatePassword();
        },
      ),
    );
  }

  _buttonView(BuildContext context) {
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
            onPressed: () {
              Get.toNamed(AppRoutes.otp);
            },
            child: Text(
              'Okay',
              style: MontserratStyles.montserratMediumTextStyle(size: 20),
            )));
  }

  _nameViewField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
        hintText: 'Name'.tr,
        labletext: 'Name'.tr,
      ),
    );
  }

  _password2textField(BuildContext cotnext) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
        hintText: 'Re-Enter Password'.tr,
        labletext: 'Re-Enter Password'.tr,
        // obsecureText: ,
        validator: (value) {
          return value?.validatePassword();
        },
      ),
    );
  }

  _genderView(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender' ?? '',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(left: 2, bottom: 5),
        Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade100,
                boxShadow: lightShadow),
            child: /* verticalDot(context) */ Text("")),
      ],
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
  _addresstextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
        hintText: 'Address'.tr,
        labletext: 'Address'.tr,
      ),
    );
  }
}
