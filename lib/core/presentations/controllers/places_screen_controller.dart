import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/links_constants.dart';

class PlacesScreenController extends GetxController {
  var placeImage = <Widget>[].obs; // Observable list of images
  var isLoading = true.obs; // Observable to track loading state

  List<bool> _favorites = List<bool>.generate(35, (index) => false);

  @override
  void onInit() {
    super.onInit();
    loadImages(); // Load images when the controller is initialized
  }

  void loadImages() async {
    try {
      // Simulate a network call to load images
      await Future.delayed(Duration(seconds: 3));
      // Load actual images into the list
      placeImage.addAll([
        InkWell(
          onTap: () {
            Get.dialog(
              AlertDialog(
                title: const Text('Kashi Vishwanath Temple'),
                content: const Text(
                    'Kashi Vishwanath Temple is one of the most famous Hindu temples dedicated to Lord Shiva. It is located in Varanasi, Uttar Pradesh, India. The temple stands on the western bank of the holy river Ganga, and is one of the twelve Jyotirlingas, the holiest of Shiva temples.'),
                actions: [
                  TextButton(
                    child: Text('Close'),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            );
          },
          child: Image.network(kashitemple),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(assiGhat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(dashashwamedh),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(manikarnika),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(sankatMochan),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(sarnath),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(ramnagarFort),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(satyaNarayanTulsimanasmandir),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(BHU),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(durgatempledurgakund),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(bharatMataMandir),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(shreeAnnaPrunaMandir),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(chaukhandiStupa),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(kedarGhat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(darbhanga),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(alamgiri),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(pnchgangaGhat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(dashashwamedh),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(nepaliTemple),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(tulsiGhat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(Kaalbhairav),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(shivalaGhat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(iskonTemple),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(shribatukBhairavTemple),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(sarnathMuseum),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(tibetanTemple),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(jantarMantar),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(scindiaghat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(harishChandraghat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(ruchikaArtGallery),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(chaousattighat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(manmandirghat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(munshighat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(ranaMahalGhat),
        ),
        InkWell(
          onTap: () {},
          child: Image.network(sarnathdeerPark),
        ),
      ]);
      isLoading.value = false;
    } catch (e) {
      print('error');
    }
  }

  // Method to check if a place is favorited
  bool isFavorite(int index) => _favorites[index];

  // Method to toggle the favorite status
  void toggleFavorite(int index) {
    _favorites[index] = !_favorites[index];
    update(); // Refresh the UI
  }

  // Method to get only favorited places
  List<Widget> get favoritePlaces {
    return [
      for (int i = 0; i < placeImage.length; i++)
        if (_favorites[i]) placeImage[i],
    ];
  }
}
