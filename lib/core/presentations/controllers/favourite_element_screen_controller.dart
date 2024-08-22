import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/core/presentations/controllers/places_screen_controller.dart';

class FavouriteElementScreenController extends GetxController {
  final PlacesScreenController placesController =
      Get.find<PlacesScreenController>();

  List<Widget> get favoritePlaces => placesController.favoritePlaces;

  var isLoading = true.obs;

  void removeFavorite(int index) {
    // Remove the favorite from the original list in PlacesScreenController
    placesController.favoritePlaces.removeAt(index);
   
    placesController.update();
    update();
  }
}
