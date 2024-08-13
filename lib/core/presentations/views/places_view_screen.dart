import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/constants/navigation.dart';
import 'package:guide_banaras/core/presentations/controllers/places_screen_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';
import 'package:guide_banaras/utilities/helper_widgets.dart';

class PlacesViewScreen extends GetView<PlacesScreenController> {
  const PlacesViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      child: GetBuilder<PlacesScreenController>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text(
              "Places in Varanasi",
              style: MontserratStyles.montserratSemiBoldTextStyle(size: 16),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.favouritescreen);
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: appcolor,
          body: Center(child: Obx(() {
            if (controller.isLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1,
                ),
                itemCount: controller.placeImage.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: controller.placeImage[index],
                            ),
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 110),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: appcolor.withOpacity(
                                        0.7), // Adjust opacity as needed
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 5,
                              child: IconButton(
                                icon: Icon(
                                  controller.isFavorite(index)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  controller.toggleFavorite(index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          })),
        ),
      ),
    );
  }
}
