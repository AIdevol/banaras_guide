import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  final searchController = TextEditingController();

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }

  void handleSearch(String value) {
    // Implement your search logic here
    print('Searching for: $value');
  }
  
final List<Color> cardColors = [
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  final List placesList = [
    InkWell(
      onTap: () {
        print('tapped');
      },
      child: Image.network(
          "https://images.deccanherald.com/deccanherald%2Fimport%2Fsites%2Fdh%2Ffiles%2Fgallery_images%2F2021%2F12%2F13%2Ffile7it39sqcijbouyq81z6.jpg?auto=format%2Ccompress&fmt=webp&fit=max&format=webp&q=70&w=900&dpr=1.3"),
    ),
    InkWell(
      onTap: () {
        print('tapped 2');
      },
      child: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/1/1e/BHU_Main_Gate%2C_Banaras_Hindu_University.jpg"),
    ),
    InkWell(
      onTap: () {
        print('tapped 3');
      },
      child: Image.network(
          "https://www.holidify.com/images/cmsuploads/compressed/SankatMochanHanumanTemple_20200228154607_20200228154630.jpg"),
    ),
    InkWell(
      onTap: () {
        print('tapped 4');
      },
      child: Image.network(
          "https://images.unsplash.com/photo-1708961370545-5f00499a1808?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dmFyYW5hc2l8ZW58MHx8MHx8fDA%3D"),
    ),
    InkWell(
      onTap: () {
        print('tapped 5');
      },
      child: Image.network(
          "https://media.istockphoto.com/id/179217479/photo/sarnath-under-the-tree.jpg?s=612x612&w=0&k=20&c=XUuImXOhg80KFyLoLu4UTng0X8ZWcz2LmBVoUYAmmi8="),
    ),
    InkWell(
      onTap: () {
        print('tapped 5');
      },
      child: Image.network(
          "https://i.pinimg.com/736x/88/1d/9e/881d9e6fb514bffa2bec94fa8f3cafc5.jpg"),
    ),
    InkWell(
      onTap: () {
        print('tapped 6');
      },
      child: Image.network(
          "https://media.istockphoto.com/id/1253050272/photo/harishchandra-ghat-varanasi-india.jpg?s=612x612&w=0&k=20&c=3xB6dW1bX2vVv1cjQ160dio-Viq7cuT3v4pu8MW41RM="),
    ),
    InkWell(
      onTap: () {},
      child: Image.network(
          "https://t4.ftcdn.net/jpg/03/91/02/51/360_F_391025164_MagJqycfkccJN0NKaBXAoJ12UT49ZJLm.jpg"),
    ),
    InkWell(
      onTap: () {},
      child: Image.network(
          "https://visitkashi.com/images/varanasi-temples/Durgakund-temple-varanasi-package.jpg"),
    ),
    InkWell(
      onTap: () {},
      child: Image.network(
          "https://kashibanaras.com/wp-content/uploads/2021/10/Kaal-Bhairav-Templ.jpg"),
    ),
  ];
}
