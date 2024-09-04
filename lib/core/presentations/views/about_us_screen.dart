import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guide_banaras/constants/colors.dart';
import 'package:guide_banaras/constants/text_constants/text_constants.dart';
import 'package:guide_banaras/core/presentations/controllers/about_us_controller.dart';
import 'package:guide_banaras/utilities/google_textfields.dart';

class AboutUsScreen extends GetView<AboutUsController> {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appcolor,
          title: Text(
            'About Us',
            style: MontserratStyles.montserratSemiBoldTextStyle(size: 16),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: FutureBuilder<String>(
              future: rootBundle.loadString(aboutUs),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: MarkdownBody(
                      data: snapshot.data ?? "Here have'nt much data",
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("data not found: ${snapshot.error}"),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )),
            Gap(10),
            _buildOkayButton(context),
            Gap(12)
          ],
        ));
  }

  Widget _buildOkayButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: appcolor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Okay',
          style: MontserratStyles.montserratSemiBoldTextStyle(
              size: 18, color: Colors.black),
        ),
      ),
    );
  }
}
