import 'package:get/get.dart';

class SplashController extends GetxController{
  final routeLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    navLogin();
  }

  void navLogin() {
    Future.delayed(const Duration(seconds: 5), () {
      routeLogin.value = true;
    });
  }
}
