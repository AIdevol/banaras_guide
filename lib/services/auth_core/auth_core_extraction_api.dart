import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../APIs/dio_client.dart';
import '../auth_abstract/auth_abstract_api_services.dart';

class AuthenticationApiServices extends GetxService implements AuthenticationApi{

  late DioClient? dioclient ;
  var deviceName,deviceType,deviceID;
  Dio dio = Dio();


  @override
  void onInit(){
    super.onInit();
  }

}