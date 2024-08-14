import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/core/presentations/controllers/profile_screen_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';
import 'package:guide_banaras/utilities/helper_widgets.dart';

class ProfileViewScreen extends GetView<ProfileScreenController> {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final containerSize = MediaQuery.of(context).size * 0.50;
    return Scaffold(
      backgroundColor: appcolor,
      appBar: AppBar(
        title: Text(
          "Profile Screen",
          style: MontserratStyles.montserratSemiBoldTextStyle(size: 16),
        ),
      ),
      body: MyAnnotatedRegion(
        child: GetBuilder<ProfileScreenController>(
          builder: (controller) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white60), /*  child: , */
            );
          },
        ),
      ),
    );
  }
}
