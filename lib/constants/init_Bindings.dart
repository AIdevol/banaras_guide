import 'package:get/get.dart';
import 'package:guide_banaras/core/presentations/bindings/bindings.dart';
import 'package:guide_banaras/core/screen_launcher/controllers/screen_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<ScreenController>(() => ScreenController());
    Get.lazyPut<ScreenBinding>(() => ScreenBinding());
  }
}
