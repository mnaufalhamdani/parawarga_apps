// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/modules/arisan/arisan_page.dart';
import 'package:parawarga_apps/modules/dashboard/dashboard_page.dart';
import 'package:parawarga_apps/modules/login/login_page.dart';
import 'package:parawarga_apps/modules/profile/profile_page.dart';
import 'package:parawarga_apps/modules/register/register_page.dart';
import 'package:parawarga_apps/modules/splash/splash_page.dart';
import 'package:parawarga_apps/modules/voting/detail/voting_detail_page.dart';
import 'package:parawarga_apps/modules/voting/voting_page.dart';

abstract class Routes {
  static const login = '/login';
  static const splash = '/splash';
  static const register = '/register';
  static const dashboard = '/dashboard';
  static const profile = '/profile';
  static const voting = '/voting';
  static const votingDetail = '/votingDetail';
  static const arisan = '/arisan';
}

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.login, page: () => LoginPage()),
    GetPage(name: Routes.splash, page: () => SplashPage()),
    GetPage(name: Routes.register, page: () => RegisterPage()),
    GetPage(name: Routes.dashboard, page: () => DashboardPage()),
    GetPage(name: Routes.profile, page: () => ProfilePage()),
    GetPage(name: Routes.voting, page: () => VotingPage()),
    GetPage(name: Routes.votingDetail, page: () => VotingDetailPage()),
    GetPage(name: Routes.arisan, page: () => ArisanPage()),
  ];
}