import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/constants/extensions/extention_validate.dart';
import 'package:guide_banaras/constants/images.dart';
import 'package:guide_banaras/constants/navigation.dart';
import 'package:guide_banaras/core/presentations/controllers/login_screen_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';
import 'package:guide_banaras/utilities/helper_widgets.dart';
import 'package:guide_banaras/utilities/text_fields_decorative.dart';
import 'package:http/http.dart';

class LoginScreen extends GetView<LoginScreenController> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false, // Add this line

        body: MyAnnotatedRegion(child:  GetBuilder<LoginScreenController>(builder: (controller)=>SafeArea(
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
        ))));
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
    final containerSize = MediaQuery.of(context).size * 0.65;
    return Padding(
      padding: const EdgeInsets.only(top: 40.0,left: 15.0, right: 15.0),
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
            children: [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: _imageField(context),
              ),
              vGap(10),
              _emailtextField(context: context),
              _passwordtextField(context: context),
              _forgotPasswordView(context),
              _buttonView(context),
              vGap(10),
              _signupView(context),
              vGap(12),
              _onlineverification(context),
              // vGap(20),
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

  _emailtextField({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: CustomTextField(
        // readOnly: true,
        prefix: Icon(FeatherIcons.mail),
        hintText: 'Email'.tr,
        labletext: 'Email'.tr,
        controller: controller.emailController,
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
        obsecureText: controller.obsecurePassword,
        onFieldSubmitted: (String? value) {
          FocusScope.of(Get.context ?? context)
              .requestFocus(controller.passwordFocusNode);
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
            Get.offAndToNamed(AppRoutes.homescreen);
          },
          child: Text(
            'Login',
            style: MontserratStyles.montserratMediumTextStyle(size: 20),
          )),
    );
  }

  _forgotPasswordView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.forgotpass);
            },
            child: Text(
              'Forgot Password',
              style: MontserratStyles.montserratRegularTextStyle(
                  size: 15, color: darkBlue),
            ))
      ],
    );
  }

  _onlineverification(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 50,
              width: 50,
              child:
                  IconButton(onPressed: () {}, icon: Image.asset(googleIcon))),
          Container(
              height: 50,
              width: 50,
              child:
                  IconButton(onPressed: () {}, icon: Image.asset(twitterIcon))),
          Container(
              height: 50,
              width: 50,
              child: IconButton(
                  onPressed: () {}, icon: Image.asset(linkedinIcon))),
        ],
      ),
    );
  }

  _signupView(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: "Don't have an account?".tr,
          style: MontserratStyles.montserratNormalTextStyle(
              size: 15, color: Colors.black),
          children: [
            TextSpan(
                text: 'SignUp'.tr,
                style: MontserratStyles.montserratNormalTextStyle(
                    size: 15, color: darkBlue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(AppRoutes.registerScreen);
                  })
          ]),
      textAlign: TextAlign.center,
    );
    // onPressed: () {},
    // child: Text(
    //   'SignUp',
    //   style: MontserratStyles.montserratNormalTextStyle(
    //       size: 15, color: darkBlue),
    // ));
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:guide_banaras/constants/colors.dart';
// import 'package:guide_banaras/constants/images.dart';
// import 'package:guide_banaras/utilities/text_fields_decorative.dart';
// import 'package:http/http.dart';

// class LoginScreen extends GetView {
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Stack(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _upperContainer(context),
//                   _downContainer(context),
//                 ],
//               ),
//               Center(
//                 child: _mainScreen(context),
//               ),
//             ],
//           ),
//         ));
//   }

//   _upperContainer(BuildContext context) {
//     final containerSize = MediaQuery.of(context).size * 0.50;
//     return Container(
//       height: containerSize.height * 0.7,
//       decoration: BoxDecoration(
//           color: appcolor,
//           borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(25),
//               bottomRight: Radius.circular(25))),
//     );
//   }

//   _downContainer(BuildContext context) {
//     final containerSize = MediaQuery.of(context).size * 0.50;
//     return Container(
//       height: containerSize.height * 0.7,
//       decoration: BoxDecoration(
//           color: appcolor,
//           borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(25), topRight: Radius.circular(25))),
//     );
//   }

//   _mainScreen(BuildContext context) {
//     final containerSize = MediaQuery.of(context).size * 0.60;
//     return GestureDetector(
//       onTap: () {
//         SystemChannels.textInput.invokeMethod('TextInput.hide');
//       },
//       child: Container(
//           alignment: Alignment.bottomCenter,
//           height: containerSize.height,
//           width: containerSize.width ,
//           decoration: BoxDecoration(
//               color: lightwh8$gray,
//               borderRadius: BorderRadius.circular(25),
//               boxShadow: const [
//                 BoxShadow(
//                     color: Colors.grey,
//                     spreadRadius: 0.2,
//                     blurRadius: 0.03,
//                     blurStyle: BlurStyle.outer)
//               ]),
//           child: Column(
//             children: [CustomTextField()],
//           )),
//     );
//   }
// }
