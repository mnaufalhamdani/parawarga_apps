// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/modules/login/login_page.dart';
import 'package:parawarga_apps/modules/splash/splash_page.dart';

abstract class Routes {
  static const login = '/login';
  static const splash = '/splash';
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.login, page: () => LoginPage()),
    GetPage(name: Routes.splash, page: () => SplashPage()),
  ];
}