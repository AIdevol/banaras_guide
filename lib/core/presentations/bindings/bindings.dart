import 'package:get/get.dart';
import 'package:guide_banaras/core/presentations/controllers/about_us_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/favourite_element_screen_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/forgot_password_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/help_section_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/home_screen_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/login_screen_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/notificaitons_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/places_screen_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/profile_screen_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/register_screen_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/reset_password_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/seetings_view_controller.dart';
import 'package:guide_banaras/core/presentations/views/settings_screen_view.dart';

class ScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<RegisterScreenController>(() => RegisterScreenController());
    Get.lazyPut<PlacesScreenController>(() => PlacesScreenController());
    Get.lazyPut<FavouriteElementScreenController>(
        () => FavouriteElementScreenController());
    Get.lazyPut<ProfileScreenController>(() => ProfileScreenController());
    Get.lazyPut<SettingsViewController>(() => SettingsViewController());
    Get.lazyPut<NotificaitonsController>(() => NotificaitonsController());
    Get.lazyPut<AboutUsController>(() => AboutUsController());
    Get.lazyPut<HelpSectionController>(() => HelpSectionController());
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
  }
}
