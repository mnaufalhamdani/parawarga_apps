import 'package:get/get.dart';
import 'package:parawarga_apps/modules/arisan/arisan_controller.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_controller.dart';
import 'package:parawarga_apps/modules/dashboard/dashboard_controller.dart';
import 'package:parawarga_apps/modules/history/history_controller.dart';
import 'package:parawarga_apps/modules/info/detail/info_detail_controller.dart';
import 'package:parawarga_apps/modules/info/info_controller.dart';
import 'package:parawarga_apps/modules/laporan/detail/laporan_detail_controller.dart';
import 'package:parawarga_apps/modules/laporan/input/laporan_input_controller.dart';
import 'package:parawarga_apps/modules/laporan/laporan_controller.dart';
import 'package:parawarga_apps/modules/login/login_controller.dart';
import 'package:parawarga_apps/modules/my_area/detail/my_area_detail_controller.dart';
import 'package:parawarga_apps/modules/my_area/my_area_controller.dart';
import 'package:parawarga_apps/modules/profile/profile_controller.dart';
import 'package:parawarga_apps/modules/register/register_controller.dart';
import 'package:parawarga_apps/modules/splash/splash_controller.dart';
import 'package:parawarga_apps/modules/tagihan/detail/tagihan_detail_controller.dart';
import 'package:parawarga_apps/modules/tagihan/tagihan_controller.dart';
import 'package:parawarga_apps/modules/unit_empty/unit_empty_controller.dart';
import 'package:parawarga_apps/modules/voting/detail/voting_detail_controller.dart';
import 'package:parawarga_apps/modules/voting/voting_controller.dart';


class BindingDependency implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => VotingController(), fenix: true);
    Get.lazyPut(() => VotingDetailController(), fenix: true);
    Get.lazyPut(() => ArisanController(), fenix: true);
    Get.lazyPut(() => ArisanDetailController(), fenix: true);
    Get.lazyPut(() => TagihanController(), fenix: true);
    Get.lazyPut(() => TagihanDetailController(), fenix: true);
    Get.lazyPut(() => HistoryController(), fenix: true);
    Get.lazyPut(() => LaporanController(), fenix: true);
    Get.lazyPut(() => LaporanDetailController(), fenix: true);
    Get.lazyPut(() => LaporanInputController(), fenix: true);
    Get.lazyPut(() => InfoController(), fenix: true);
    Get.lazyPut(() => InfoDetailController(), fenix: true);
    Get.lazyPut(() => UnitEmptyController(), fenix: true);
    Get.lazyPut(() => MyAreaController(), fenix: true);
    Get.lazyPut(() => MyAreaDetailController(), fenix: true);
  }
}