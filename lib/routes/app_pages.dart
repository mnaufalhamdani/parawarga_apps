// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/modules/arisan/arisan_page.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_page.dart';
import 'package:parawarga_apps/modules/dashboard/dashboard_page.dart';
import 'package:parawarga_apps/modules/history/history_page.dart';
import 'package:parawarga_apps/modules/info/detail/info_detail_page.dart';
import 'package:parawarga_apps/modules/info/info_page.dart';
import 'package:parawarga_apps/modules/laporan/detail/laporan_detail_page.dart';
import 'package:parawarga_apps/modules/laporan/laporan_page.dart';
import 'package:parawarga_apps/modules/login/login_page.dart';
import 'package:parawarga_apps/modules/profile/profile_page.dart';
import 'package:parawarga_apps/modules/register/register_page.dart';
import 'package:parawarga_apps/modules/splash/splash_page.dart';
import 'package:parawarga_apps/modules/tagihan/detail/tagihan_detail_page.dart';
import 'package:parawarga_apps/modules/tagihan/tagihan_page.dart';
import 'package:parawarga_apps/modules/unit_empty/unit_empty_page.dart';
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
  static const arisanDetail = '/arisanDetail';
  static const tagihan = '/tagihan';
  static const tagihanDetail = '/tagihanDetail';
  static const history = '/history';
  static const laporan = '/laporan';
  static const laporanDetail = '/laporanDetail';
  static const info = '/info';
  static const infoDetail = '/infoDetail';
  static const unitEmpty = '/unitEmpty';
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
    GetPage(name: Routes.arisanDetail, page: () => ArisanDetailPage()),
    GetPage(name: Routes.tagihan, page: () => TagihanPage()),
    GetPage(name: Routes.tagihanDetail, page: () => TagihanDetailPage()),
    GetPage(name: Routes.history, page: () => HistoryPage()),
    GetPage(name: Routes.laporan, page: () => LaporanPage()),
    GetPage(name: Routes.laporanDetail, page: () => LaporanDetailPage()),
    GetPage(name: Routes.info, page: () => InfoPage()),
    GetPage(name: Routes.infoDetail, page: () => InfoDetailPage()),
    GetPage(name: Routes.unitEmpty, page: () => UnitEmptyPage()),
  ];
}