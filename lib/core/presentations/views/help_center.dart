import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/core/presentations/controllers/help_section_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';

class HelpCenter extends GetView<HelpSectionController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpSectionController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Help Center',
            style: MontserratStyles.montserratSemiBoldTextStyle(
                size: 18, color: Colors.white),
          ),
          backgroundColor: appcolor,
        ),
        body: ListView.separated(
          itemCount: controller.reviewedQuestion.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey.withOpacity(0.3),
            thickness: 1.0,
            indent: 10.0,
            endIndent: 10.0,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                controller.reviewedQuestion[index],
                style: MontserratStyles.montserratNormalTextStyle(
                    size: 15, color: Colors.black),
              ),
              trailing: const Icon(
                Icons.arrow_forward,
                color: Colors.blueGrey,
              ),
              onTap: () {
                print('Button tapped: $index');
              },
            );
          },
        ),
      ),
    );
  }
}
