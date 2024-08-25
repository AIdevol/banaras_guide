import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/core/presentations/controllers/about_us_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';

class AboutUsScreen extends GetView<AboutUsController> {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appcolor,
        appBar: AppBar(
          title: Text(
            'About_Us',
            style: MontserratStyles.montserratSemiBoldTextStyle(size: 16),
          ),
        ),
        body: Center(
          child: Text(
            'About us',
            style: MontserratStyles.montserratSemiBoldTextStyle(size: 16),
          ),
        ));
  }
}
