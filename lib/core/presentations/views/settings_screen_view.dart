import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/core/presentations/controllers/seetings_view_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';
import 'package:guide_banaras/utilities/helper_widgets.dart';

class SettingsScreenView extends GetView<SettingsViewController> {
  const SettingsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appcolor,
        appBar: AppBar(
          title: Text(
            'Settings',
            style: MontserratStyles.montserratSemiBoldTextStyle(size: 16),
          ),
        ),
        body: MyAnnotatedRegion(child: GetBuilder<SettingsViewController>(
          builder: (controller) => ListView(
            children: [_lightAndDarkView(context), _languageSettings(context)],
          ),
        ),));
  }

  _lightAndDarkView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: 50,
        // color: ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dark Mode",
              style: MontserratStyles.montserratMediumTextStyle(
                  size: 16, color: Colors.white),
            ),
            // Switch(value: isdarkmode, onChanged: onChanged)
          ],
        ),
      ),
    );
  }

  _languageSettings(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: 50,
        // color: ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Language",
              style: MontserratStyles.montserratMediumTextStyle(
                  size: 16, color: Colors.white),
            ),
            Text(
              "Dark Mode",
              style: MontserratStyles.montserratMediumTextStyle(
                  size: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
