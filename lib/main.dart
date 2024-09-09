import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:guide_banaras/constants/init_Bindings.dart';
import 'package:guide_banaras/constants/navigation.dart';
import 'package:guide_banaras/constants/navigation/app_page.dart';
import 'package:guide_banaras/core/screen_launcher/view/screen_launcher.dart';
import 'package:logger/logger.dart';

var log = Logger();

GetStorage storage = GetStorage();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Guide',
          scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          }),
          // builder: ,
          getPages: AppPage.routes,
          initialBinding: InitBindings(),
          initialRoute: AppPage.Initial,
          debugShowCheckedModeBanner: false,
          logWriterCallback: LoggerX.write,
          theme: ThemeData(
              appBarTheme:
                  const AppBarTheme(backgroundColor: Colors.transparent),
              bottomSheetTheme:
                  const BottomSheetThemeData(backgroundColor: Colors.black)),
          home: child,
        );
      },
      // child: const ScreenLauncher(),
    );
  }
}

class LoggerX {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => isError ? log.v("$text") : log.i("$text"));
  }
}
