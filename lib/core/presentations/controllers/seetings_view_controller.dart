import 'package:get/get.dart';

class SettingsViewController extends GetxController {
  bool isDarkMode = false;
  bool isNotificationsEnabled = true; // Notifications toggle
  double fontSize = 16.0; // Font size

  String selectedLanguage = "English";
  List<String> languages = ["English", "Hindi", "Spanish", "French"];

  void toggleDarkMode(bool value) {
    isDarkMode = value;
    update(); // Notify the UI
  }

  void toggleNotifications(bool value) {
    isNotificationsEnabled = value;
    update(); // Notify the UI
  }

  void updateFontSize(double value) {
    fontSize = value;
    update(); // Notify the UI
  }

  void updateLanguage(String? language) {
    if (language != null) {
      selectedLanguage = language;
      update();
    }
  }

  // void logout() {
  //   // Perform logout logic
  //   Get.offAll(LoginScreenView());
  // }
}
