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
      backgroundColor: controller.isDarkMode ? Colors.black : appcolor,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: MontserratStyles.montserratSemiBoldTextStyle(size: 16),
        ),
      ),
      body: MyAnnotatedRegion(
        child: GetBuilder<SettingsViewController>(
          builder: (controller) => Container(
            color: controller.isDarkMode ? Colors.black : appcolor,
            child: ListView(
              children: [
                _lightAndDarkView(context),
                const Gap(16),
                _notificationToggle(context),
                const Gap(16),
                _languageSettings(context),
                const Gap(16),
                _fontSizeSlider(context),
                const Gap(16),
                _privacySettings(context),
                const Gap(16),
                _accountSettings(context),
                // const Gap(16),
                // _logoutButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _lightAndDarkView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dark Mode",
              style: MontserratStyles.montserratMediumTextStyle(
                  size: 16, color: Colors.white),
            ),
            Switch(
              value: controller.isDarkMode,
              onChanged: (value) {
                controller.toggleDarkMode(value);
              },
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.white,
            ),
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
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Language",
              style: MontserratStyles.montserratMediumTextStyle(
                  size: 16, color: Colors.white),
            ),
            DropdownButton<String>(
              value: controller.selectedLanguage,
              dropdownColor:
                  controller.isDarkMode ? Colors.grey[800] : Colors.white,
              items: controller.languages.map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(
                    language,
                    style: MontserratStyles.montserratMediumTextStyle(
                        size: 16,
                        color: controller.isDarkMode
                            ? Colors.white
                            : Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                controller.updateLanguage(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }

  _notificationToggle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Enable Notifications",
              style: MontserratStyles.montserratMediumTextStyle(
                  size: 16, color: Colors.white),
            ),
            Switch(
              value: controller.isNotificationsEnabled,
              onChanged: (value) {
                controller.toggleNotifications(value);
              },
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  _fontSizeSlider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Font Size",
            style: MontserratStyles.montserratMediumTextStyle(
                size: 16, color: Colors.white),
          ),
          Slider(
            value: controller.fontSize,
            min: 12.0,
            max: 24.0,
            divisions: 6,
            onChanged: (newValue) {
              controller.updateFontSize(newValue);
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  _privacySettings(BuildContext context) {
    return ListTile(
      title: Text(
        "Privacy Settings",
        style: MontserratStyles.montserratMediumTextStyle(
            size: 16, color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward, color: Colors.white),
      onTap: () {
        // Get.to(PrivacySettingsView());
      },
    );
  }

  _accountSettings(BuildContext context) {
    return ListTile(
      title: Text(
        "Account Settings",
        style: MontserratStyles.montserratMediumTextStyle(
            size: 16, color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward, color: Colors.white),
      onTap: () {
        // Get.to(AccountSettingsView());
      },
    );
  }

  // _logoutButton(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.red,
  //         padding: const EdgeInsets.symmetric(vertical: 16.0),
  //         textStyle: TextStyle(fontSize: 16),
  //       ),
  //       onPressed: () {
  //         // controller.logout();
  //       },
  //       child: const Text("Logout"),
  //     ),
  //   );
  // }
}
