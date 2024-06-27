import 'package:parawarga_apps/modules/login/login_page.dart';

import 'package:get/get.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class Routes {
  static const LOGIN = '/login'; // login page
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
  ];
}