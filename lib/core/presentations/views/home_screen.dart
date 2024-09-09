import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/constants/images.dart';
import 'package:guide_banaras/core/componets/main_menu.dart';
import 'package:guide_banaras/core/presentations/controllers/home_screen_controller.dart';
import 'package:guide_banaras/utilities/auto_scrolling_animation.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';
import 'package:guide_banaras/utilities/helper_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  // final HomeScreenController _controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      // init: _controller,
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        style: DrawerStyle.style1,
        menuScreen: MenuScreen(),
        mainScreen: MainScreenWidget(),
        borderRadius: 25,
        showShadow: true,
        angle: 0.0,
        drawerShadowsBackgroundColor: Colors.grey,
        // slideWidth: MediaQuery.of(context).size.width,
        openCurve: Curves.fastOutSlowIn,
        // closeCurve: Curves.bounceIn,
      ),
    );
  }
}

// class MainScreenWidget extends GetView<HomeScreenController> {
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final searchScreenSize = screenSize * 0.3;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appcolor,
//         leading: IconButton(
//           onPressed: controller.toggleDrawer,
//           icon: Icon(
//             Icons.menu,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   height: screenSize.height * 0.23,
//                   width: screenSize.width,
//                   decoration: BoxDecoration(
//                     color: appcolor, // Background color for the container
//                   ),
//                   child: Stack(
//                     children: [
//                       // Image Layer
//                       Positioned.fill(
//                         child: Image.asset(
//                           bgimage,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       // Overlay with appcolor
//                       Positioned.fill(
//                         child: Container(
//                           color: appcolor.withOpacity(
//                               0.9), // Adjust opacity for visibility
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Container(
//                 //   height: screenSize.height * 0.23,
//                 //   width: screenSize.width,
//                 //   decoration: BoxDecoration(color: appcolor),
//                 // ),
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               top: screenSize.height * 0.35 - searchScreenSize.height / 2,
//               left: screenSize.width * 0.025,
//               right: searchScreenSize.width * 0.12,
//               child: _searchScreen(context, searchScreenSize),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _searchScreen(BuildContext context, Size searchScreenSize) {
//     return Container(
//       height: searchScreenSize.height * 0.20,
//       width: searchScreenSize.width * 3,
//       decoration: BoxDecoration(
//         color: lightwh8$gray,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 0.3)],
//       ),
//       child: TextField(
//         controller: controller.searchController,
//         onChanged: (value) {
//           controller.handleSearch(value);
//         },
//         decoration: const InputDecoration(
//           hintText: 'Search',
//           border: InputBorder.none,
//           prefixIcon: Icon(Icons.search),
//           contentPadding: EdgeInsets.all(12),
//         ),
//       ),
//     );
//   }
// }
class MainScreenWidget extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final searchScreenSize = screenSize * 0.3;

    return Scaffold(
      backgroundColor: appcolor, // Set the background color to appcolor
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: screenSize.height * 0.23,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: appcolor, // Background color for the container
                  ),
                  child: Stack(
                    children: [
                      // Image Layer
                      Positioned.fill(
                        child: Image.asset(
                          bgimage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Overlay with appcolor
                      Positioned.fill(
                        child: Container(
                          padding: const EdgeInsets.only(top: 28),
                          alignment: Alignment.topCenter,
                          color: appcolor.withOpacity(0.9),
                          child: _titleViewHeading(context),
                            // Row(children: [_titleViewHeading(context),IconButton(onPressed: (){}, icon: Icon(Icons.map))],)
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: appcolor,
                    ),
                    child: _boxViewbuild(context),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                onPressed: controller.toggleDrawer,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),

            Positioned(
              top: screenSize.height * 0.35 - searchScreenSize.height / 2,
              left: screenSize.width * 0.025,
              right: searchScreenSize.width * 0.12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_searchScreen(context, searchScreenSize),_buildContainer(context, searchScreenSize) ],),
            ),
          ],
        ),
      ),
    );
  }

  _buildContainer(BuildContext context,Size searchScreenSize){
    return GestureDetector(
      onTap: (){
        print('hellow bhai tapped krke jao na');
      },
      child: Container(
        height: searchScreenSize.height * 0.20,
        width: searchScreenSize.width * 0.50,
          decoration: BoxDecoration(color: lightwh8$gray,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 0.3)],),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset('assets/route-solid.svg'),
          ),),
    );
  }
  _searchScreen(BuildContext context, Size searchScreenSize) {
    return Container(
      height: searchScreenSize.height * 0.20,
      width: searchScreenSize.width * 2.5,
      decoration: BoxDecoration(
        color: lightwh8$gray,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 0.3)],
      ),
      child: TextField(
        controller: controller.searchController,
        onChanged: (value) {
          controller.handleSearch(value);
        },
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(12),
        ),
      ),
    );
  }

  _titleViewHeading(BuildContext context) {
    return Text.rich(TextSpan(
        text: "Banaras Compass",
        style: MontserratStyles.montserratBoldTextStyle(size: 20)));
  }

  Widget _boxViewbuild(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.2;
    final HomeScreenController controllerList = HomeScreenController();

    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Top Places..",
              style: MontserratStyles.montserratSemiBoldTextStyle(
                  color: Colors.white),
            ),
          ),
          const Gap(10),
          SizedBox(
            height: containerHeight * 1.3,
            child: _buildCardView(context),
          ),
          SizedBox(
            height: 250,
            child: AutoScrollingPageView(
              itemCount: controllerList.placesList.length,
              itemBuilder: (BuildContext context, int index, PageController pageController) {
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (pageController.position.haveDimensions) {
                      value = pageController.page! - index;
                      value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                    }
                    return Transform.scale(
                      scale: Curves.easeOut.transform(value),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          right: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            print('Tapped item $index');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: containerHeight * 0.4,
                            width: containerHeight * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                            ),
                            child: controllerList.placesList[index],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Gap(10),
          SmoothPageIndicator(
            controller: controller.pageController,
            count: controllerList.placesList.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.white,
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 3,
            ),
          ),
        ],
      ),
    );
  }

  _buildCardView(BuildContext context) {
    final HomeScreenController controller = HomeScreenController();
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              controller.previousCard();
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Swiper(
                itemCount: controller.cardColors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      // height: ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: controller.cardColors[index],
                    ),
                  );
                },
                itemWidth: MediaQuery.of(context).size.width * 0.6,
                itemHeight: MediaQuery.of(context).size.height * 0.5,
                layout: SwiperLayout.STACK,
                controller: controller.swiperController,
                index: controller.currentIndex,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              controller.nextCard();
            },
          ),
        ],
      ),
    );
  }
}

