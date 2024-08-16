import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

class SettingsViewController extends GetxController {
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final RxString currentLanguage = FlutterLocalization.instance.currentLocale.toString().obs;

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
  }

  void setLanguage(String languageCode) {
    FlutterLocalization.instance.translate(languageCode);
    currentLanguage.value = languageCode;
  }
}