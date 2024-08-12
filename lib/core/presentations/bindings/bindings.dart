import 'package:get/get.dart';
import 'package:guide_banaras/core/presentations/controllers/home_screen_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/login_screen_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/register_screen_controller.dart';

class ScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<RegisterScreenController>(() => RegisterScreenController());

  }
}
