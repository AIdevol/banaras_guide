import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/navigation.dart';
import 'package:guide_banaras/core/presentations/bindings/bindings.dart';
import 'package:guide_banaras/core/presentations/controllers/places_screen_controller.dart';
import 'package:guide_banaras/core/presentations/controllers/profile_screen_controller.dart';
import 'package:guide_banaras/core/presentations/views/about_us_screen.dart';
import 'package:guide_banaras/core/presentations/views/favourite_element_screen.dart';
import 'package:guide_banaras/core/presentations/views/home_screen.dart';
import 'package:guide_banaras/core/presentations/views/login_screen.dart';
import 'package:guide_banaras/core/presentations/views/nottifications.dart';
import 'package:guide_banaras/core/presentations/views/places_view_screen.dart';
import 'package:guide_banaras/core/presentations/views/profile_view_screen.dart';
import 'package:guide_banaras/core/presentations/views/register_screen.dart';
import 'package:guide_banaras/core/presentations/views/settings_screen_view.dart';
import 'package:guide_banaras/core/screen_launcher/bindings/screen_launcher_bindings.dart';
import 'package:guide_banaras/core/screen_launcher/view/screen_launcher.dart';

class AppPage {
  static const Initial = AppRoutes.screenLauncher;
  static final routes = [
    GetPage(
      name: AppRoutes.screenLauncher,
      binding: SplashBinding(),
      page: () => const ScreenLauncher(),
    ),
    GetPage(
      name: AppRoutes.loginscreen,
      binding: ScreenBinding(),
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.homescreen,
      binding: ScreenBinding(),
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.registerScreen,
      binding: ScreenBinding(),
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.placeView,
      binding: ScreenBinding(),
      page: () => const PlacesViewScreen(),
    ),
    GetPage(
      name: AppRoutes.favouritescreen,
      binding: ScreenBinding(),
      page: () => const FavouriteElementScreen(),
    ),
    GetPage(
      name: AppRoutes.profilescreen,
      binding: ScreenBinding(),
      page: () => const ProfileViewScreen(),
    ),
    GetPage(
      name: AppRoutes.settingsScreen,
      binding: ScreenBinding(),
      page: () => const SettingsScreenView(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      binding: ScreenBinding(),
      page: () => const Notifications(),
    ),
    GetPage(
      name: AppRoutes.aboutUs,
      binding: ScreenBinding(),
      page: () => const AboutUsScreen(),
    ),
  ];
}
