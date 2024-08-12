import 'package:get/get.dart';
import 'package:guide_banaras/core/screen_launcher/controllers/screen_controller.dart';



class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenController>(
      () => ScreenController(),
    );

    // Get.put(() => GetLoginModalService(),permanent: true);
  }
}
