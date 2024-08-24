import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/core/presentations/controllers/favourite_element_screen_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';
import 'package:guide_banaras/utilities/helper_widgets.dart';

// class FavouriteElementScreen extends GetView<FavouriteElementScreenController> {
//   const FavouriteElementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MyAnnotatedRegion(
//       child: GetBuilder<FavouriteElementScreenController>(
//         builder: (controller) => Scaffold(
//           backgroundColor: appcolor,
//           appBar: AppBar(
//             title: Text(
//               "Favourite Places",
//               style: MontserratStyles.montserratSemiBoldTextStyle(size: 15),
//             ),
//           ),
//           body: controller.favoritePlaces.isEmpty
//               ? const Center(
//                   child: Text(
//                     "No Favorite Places",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 )
//               : GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10.0,
//                     mainAxisSpacing: 10.0,
//                     childAspectRatio: 1,
//                   ),
//                   itemCount: controller.favoritePlaces.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//                       child: Container(
//                         height: 50,
//                         width: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.white60,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Stack(
//                           children: [
//                             Positioned.fill(
//                               child: controller.favoritePlaces[index],
//                             ),
//                             Positioned.fill(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 110),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: appcolor.withOpacity(0.7),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: 4,
//                               right: 5,
//                               child: Row(
//                                 children: [
//                                   IconButton(
//                                     icon: const Icon(
//                                       // controller.isFavorite(index)
//                                       Icons.favorite,
//                                       // : Icons.favorite_border,
//                                       color: Colors.red,
//                                     ),
//                                     onPressed: () {
//                                       controller.toggleFavorite(index);
//                                     },
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(
//                                       // controller.isFavorite(index)
//                                       Icons.delete,
//                                       // : Icons.favorite_border,
//                                       color: Colors.red,
//                                     ),
//                                     onPressed: () {
//                                       controller.favoritePlaces.removeAt(index);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//         ),
//       ),
//     );
//   }
// }
class FavouriteElementScreen extends GetView<FavouriteElementScreenController> {
  const FavouriteElementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAnnotatedRegion(
      child: GetBuilder<FavouriteElementScreenController>(
        builder: (controller) => Scaffold(
          backgroundColor: appcolor,
          appBar: AppBar(
            title: Text(
              "Favourite Places",
              style: MontserratStyles.montserratSemiBoldTextStyle(size: 15),
            ),
          ),
          body: controller.favoritePlaces.isEmpty
              ? const Center(
                  child: Text(
                    "No Favorite Places",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: controller.favoritePlaces.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                              child: controller.favoritePlaces[index],
                            ),
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 110),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: appcolor.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 5,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      // This functionality is not implemented in the given code
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      _showDialogue(context, index);
                                      // controller.removeFavorite(index);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  _showDialogue(BuildContext context, int index) {
    // final int indexI = Get.find<FavouriteElementScreenController>().removeFavorite;
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: appcolor,
              content: Text(
                'Delete your Favourite place',
                style: MontserratStyles.montserratMediumTextStyle(
                    size: 16, color: Colors.black),
              ),
              actions: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Cancel',
                          style: MontserratStyles.montserratMediumTextStyle(
                              size: 15, color: darkBlue),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.find<FavouriteElementScreenController>()
                              .removeFavorite
                              .obs;
                          Get.back();
                          controller.removeFavorite(index);
                        },
                        child: Text(
                          'Yes',
                          style: MontserratStyles.montserratMediumTextStyle(
                              size: 15, color: darkBlue),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ));
  }
}
