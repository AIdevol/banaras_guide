import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/constants/images.dart';
import 'package:guide_banaras/constants/navigation.dart';
import 'package:guide_banaras/core/otp/controller/otp_screen_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';
import 'package:guide_banaras/utilities/helper_widgets.dart';
import 'package:guide_banaras/utilities/text_fields_decorative.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends GetView<OtpScreenController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyAnnotatedRegion(
        child: GetBuilder<OtpScreenController>(
          builder: (controller) => SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              _upperContainer(context, constraints),
                              Expanded(child: SizedBox()),
                              _downContainer(context, constraints),
                            ],
                          ),
                          Positioned(
                            left: constraints.maxWidth * 0.05,
                            right: constraints.maxWidth * 0.05,
                            top: constraints.maxHeight * 0.20,
                            child: _mainScreen(context, constraints),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _upperContainer(BuildContext context, BoxConstraints constraints) {
    return Container(
      height: constraints.maxHeight * 0.35,
      decoration: BoxDecoration(
        color: appcolor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }

  Widget _downContainer(BuildContext context, BoxConstraints constraints) {
    return Container(
      height: constraints.maxHeight * 0.35,
      decoration: BoxDecoration(
        color: appcolor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
    );
  }

  Widget _mainScreen(BuildContext context, BoxConstraints constraints) {
    return Container(
      constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.6),
      decoration: BoxDecoration(
        color: lightwh8$gray,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0.2,
            blurRadius: 0.03,
            blurStyle: BlurStyle.outer,
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _imageField(context: context),
              vGap(10),
              Center(
                child: Text(
                  'Enter your OTP',
                  style: MontserratStyles.montserratSemiBoldTextStyle(
                    size: 18,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              vGap(20),
              _otptextField(context: context),
              // vGap(05),
              _buildResentOtp(context:context),
              vGap(10),
              _buttonView(context: context),
            ],
          ),
        ),
      ),
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

  _otptextField({required BuildContext context}) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Pinput(
        length: 6,
        // controller: controller.otpController,
        // focusNode: controller.otpFocusNode,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        showCursor: true,
        onCompleted: (pin) {
          // controller.verifyOtp(pin);
        },
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
            onPressed: () {
              Get.toNamed(AppRoutes.resetpass);
              print('otp buttton tapped');
            },
            child: Text(
              'Verify',
              style: MontserratStyles.montserratMediumTextStyle(size: 20),
            )));
  }

  Widget _buildResentOtp({required BuildContext context}){
    return Text.rich(
      TextSpan(
          text: "Didn't receive the OTP? ".tr,
          style:
          MontserratStyles.montserratBoldTextStyle(size: 14, color: Colors.black45),
          children: [
            TextSpan(
              text: "Resend Now".tr,
              recognizer: new TapGestureRecognizer()
                ..onTap = /*controller.resendCode*/
                controller.enableResend ? controller.resendCode : null,
              style: MontserratStyles.montserratBoldTextStyle(
                  size: 14,
                  color: controller.enableResend ? appcolor : darkBlue),
            ),
          ]),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ).paddingSymmetric(vertical: 30, horizontal: 0);
  }

}

