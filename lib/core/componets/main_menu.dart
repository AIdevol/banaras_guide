// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:guide_banaras/constants/colors.dart';
// import 'package:guide_banaras/constants/navigation.dart';
// import 'package:guide_banaras/constants/navigation/app_page.dart';
// import 'package:guide_banaras/core/presentations/controllers/home_screen_controller.dart';

// class MenuScreen extends GetView<HomeScreenController> {
//   final List<Widget> buttons = <Widget>[
//     InkWell(
//       onTap: () {
//         // print('tapped');
//         Get.toNamed(AppRoutes.placeView);
//       },
//       child: const Text(
//         "Places",
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//     InkWell(
//       onTap: () {
//         Get.toNamed(AppRoutes.profilescreen);
//       },
//       child: const Text(
//         "Profile",
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//     InkWell(
//       onTap: () {
//         Get.toNamed(AppRoutes.settingsScreen);
//       },
//       child: const Text(
//         "Settings",
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//     InkWell(
//       onTap: () {},
//       child: const Text(
//         "Suggetions",
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//     InkWell(
//       splashColor: Colors.blue.withOpacity(0.5),
//       highlightColor: Colors.blue.withOpacity(0.3),
//       onTap: () {
//         print("tapped hello");
//       },
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: const Text(
//           "Help",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     )
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: appcolor,
//       body: Container(
//         color: appcolor.withOpacity(0.7),
//         child: Column(
//           children: [
//             // Circular Avatar for Image
//             const Padding(
//               padding: EdgeInsets.only(top: 100.0),
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundImage: NetworkImage(
//                     'https://images.pexels.com/photos/1374510/pexels-photo-1374510.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1g'), // Replace with your image path
//               ),
//             ),
//             const Gap(70),
//             // List of Menu Options
//             Expanded(
//               child: ListView.separated(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 itemCount: 5,
//                 itemBuilder: (BuildContext context, int index) => Container(
//                     alignment: Alignment.center,
//                     height: 40,
//                     width: 170,
//                     decoration: BoxDecoration(
//                       color: appcolor,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.white),
//                     ),
//                     child: buttons[index]),
//                 separatorBuilder: (BuildContext context, int index) =>
//                     const Gap(20),
//               ),
//             ),
//             const Gap(20),
//             // Logout Button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: appcolor,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
//                   shape: RoundedRectangleBorder(
//                     side: const BorderSide(color: Colors.white),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   'Logout',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/constants/navigation.dart';
import 'package:guide_banaras/constants/navigation/app_page.dart';
import 'package:guide_banaras/core/presentations/controllers/home_screen_controller.dart';

class MenuScreen extends GetView<HomeScreenController> {
  final List<Widget> buttons = <Widget>[
    InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.placeView);
      },
      child: const Text(
        "Places",
        style: TextStyle(color: Colors.white),
      ),
    ),
    InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.profilescreen);
      },
      child: const Text(
        "Profile",
        style: TextStyle(color: Colors.white),
      ),
    ),
    InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.settingsScreen);
      },
      child: const Text(
        "Settings",
        style: TextStyle(color: Colors.white),
      ),
    ),
    InkWell(
      onTap: () {},
      child: const Text(
        "About us",
        style: TextStyle(color: Colors.white),
      ),
    ),
    InkWell(
      splashColor: Colors.blue.withOpacity(0.5),
      highlightColor: Colors.blue.withOpacity(0.3),
      onTap: () {
        print("tapped hello");
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: const Text(
          "Help",
          style: TextStyle(color: Colors.white),
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor,
      body: Stack(
        children: [
          Container(
            color: appcolor.withOpacity(0.7),
            child: Column(
              children: [
                // Circular Avatar for Image
                const Gap(30),
                const Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/1374510/pexels-photo-1374510.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1g'),
                  ),
                ),
                const Gap(70),
                // List of Menu Options
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) => Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 170,
                        decoration: BoxDecoration(
                          color: appcolor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                        ),
                        child: buttons[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Gap(20),
                  ),
                ),
                const Gap(20),
                // Logout Button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appcolor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 75, vertical: 10),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Notifications Icon
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.notifications);
                print('Notifications tapped');
              },
            ),
          ),
        ],
      ),
    );
  }
}
