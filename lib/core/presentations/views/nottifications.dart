import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/core/presentations/controllers/notificaitons_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';

class Notifications extends GetView {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor,
      appBar: AppBar(
        title: Text(
          'Notification',
          style: MontserratStyles.montserratSemiBoldTextStyle(size: 16),
        ),
      ),
      body: GetBuilder<NotificaitonsController>(
        builder: (controller) => Container(
          child: Center(child: Text('Notifications..')),
        ),
      ),
    );
  }
}
