import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../APIs/api_ends.dart';
import '../APIs/dio_client.dart';
import '../auth_abstract/auth_abstract_api_services.dart';

class AuthenticationApiServices extends GetxService implements AuthenticationApi{

  late DioClient? dioClient ;
  var deviceName,deviceType,deviceID;
  Dio dio = Dio();


  getDeviceData() async {
    DeviceInfoPlugin info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await info.androidInfo;
      deviceName = androidDeviceInfo.model;
      deviceID = androidDeviceInfo.device;
      deviceType = "1";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await info.iosInfo;
      deviceName = iosDeviceInfo.model;
      deviceID = iosDeviceInfo.identifierForVendor;
      deviceType = "2";
    }
  }

  @override
  void onInit() {
    var dio = Dio();
    dioClient = DioClient(APIends.baseUrl, dio);
    getDeviceData();
  }

}