// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/modules/arisan/arisan_page.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_page.dart';
import 'package:parawarga_apps/modules/dashboard/dashboard_page.dart';
import 'package:parawarga_apps/modules/history/history_page.dart';
import 'package:parawarga_apps/modules/info/detail/info_detail_page.dart';
import 'package:parawarga_apps/modules/info/info_page.dart';
import 'package:parawarga_apps/modules/issue/detail/issue_detail_page.dart';
import 'package:parawarga_apps/modules/issue/input/issue_input_page.dart';
import 'package:parawarga_apps/modules/issue/issue_page.dart';
import 'package:parawarga_apps/modules/login/login_page.dart';
import 'package:parawarga_apps/modules/my_area_unit/my_area_page.dart';
import 'package:parawarga_apps/modules/profile/about_app/about_app_page.dart';
import 'package:parawarga_apps/modules/profile/my_unit/empty/my_unit_empty_page.dart';
import 'package:parawarga_apps/modules/profile/my_unit/input/my_unit_input_map_page.dart';
import 'package:parawarga_apps/modules/profile/my_unit/input/my_unit_input_page.dart';
import 'package:parawarga_apps/modules/profile/my_unit/my_unit_page.dart';
import 'package:parawarga_apps/modules/profile/profile_page.dart';
import 'package:parawarga_apps/modules/register/register_page.dart';
import 'package:parawarga_apps/modules/splash/splash_page.dart';
import 'package:parawarga_apps/modules/tagihan/create/tagihan_create_page.dart';
import 'package:parawarga_apps/modules/tagihan/detail/tagihan_detail_page.dart';
import 'package:parawarga_apps/modules/tagihan/pembayaran/tagihan_pembayaran_page.dart';
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
  static const tagihanCreate = '/tagihanCreate';
  static const tagihanPembayaran = '/tagihanPembayaran';
  static const history = '/history';
  static const issue = '/issue';
  static const issueDetail = '/issueDetail';
  static const issueInput = '/issueInput';
  static const info = '/info';
  static const infoDetail = '/infoDetail';
  static const unitEmpty = '/unitEmpty';
  static const myArea = '/myArea';
  static const myUnit = '/myUnit';
  static const myUnitInput = '/myUnitInput';
  static const myUnitInputMap = '/myUnitInputMap';
  static const myUnitEmpty = '/myUnitEmpty';
  static const aboutAppPage = '/aboutAppPage';
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
    GetPage(name: Routes.tagihanCreate, page: () => TagihanCreatePage()),
    GetPage(name: Routes.tagihanPembayaran, page: () => TagihanPembayaranPage()),
    GetPage(name: Routes.history, page: () => HistoryPage()),
    GetPage(name: Routes.issue, page: () => IssuePage()),
    GetPage(name: Routes.issueDetail, page: () => IssueDetailPage()),
    GetPage(name: Routes.issueInput, page: () => IssueInputPage()),
    GetPage(name: Routes.info, page: () => InfoPage()),
    GetPage(name: Routes.infoDetail, page: () => InfoDetailPage()),
    GetPage(name: Routes.unitEmpty, page: () => UnitEmptyPage()),
    GetPage(name: Routes.myArea, page: () => MyAreaPage()),
    GetPage(name: Routes.myUnit, page: () => MyUnitPage()),
    GetPage(name: Routes.myUnitInput, page: () => MyUnitInputPage()),
    GetPage(name: Routes.myUnitInputMap, page: () => MyUnitInputMapPage()),
    GetPage(name: Routes.myUnitEmpty, page: () => MyUnitEmptyPage()),
    GetPage(name: Routes.aboutAppPage, page: () => AboutAppPage()),
  ];
}