// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:get/get.dart';

import '../../utils/environment.dart';

class BaseService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ConfigEnvironments.getEnvironment().url;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 60);//1 Menit
    httpClient.addResponseModifier((request, response) async {
      log(request.url.toString());
      log("Method: ${request.method.toUpperCase()}");
      log("Status: ${response.status.code}");
      log("Response: ${response.body.toString()}");

      if(response.status.code! >= 300){
        log("Error: ${response.statusText}");
      }
      return response;
    });

    super.onInit();
  }
}