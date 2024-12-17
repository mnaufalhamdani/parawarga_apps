import 'package:get/get.dart';
import 'package:parawarga_apps/config/local/migration_version.dart';
import 'package:parawarga_apps/data/provider/login_provider.dart';
import 'package:parawarga_apps/data/provider/register_provider.dart';
import 'package:parawarga_apps/data/repository/login_repository.dart';
import 'package:parawarga_apps/data/repository/profile_repository.dart';
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

import '../../config/local/database_config.dart';
import '../../utils/environment.dart';
import '../repository/register_repository.dart';


class BindingDependency implements Bindings {
  @override
  Future<void> dependencies() async {
    final env = ConfigEnvironments.getEnvironment();

    //Database
    final database = await $FloorDatabaseConfig.databaseBuilder(env.dbName).addMigrations([
      migration1to2,
      migration2to3,
    ]).build();
    Get.lazyPut<DatabaseConfig>(() => database, fenix: true);

    //Controller
    Get.lazyPut(() => SplashController(repository: Get.find()), fenix: true);
    Get.lazyPut(() => LoginController(repository: Get.find()), fenix: true);
    Get.lazyPut(() => RegisterController(repository: Get.find()), fenix: true);
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => ProfileController(repository: Get.find()), fenix: true);
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

    //Provider
    Get.lazyPut(() => LoginProvider(), fenix: true);
    Get.lazyPut(() => RegisterProvider(), fenix: true);

    //Repository
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(Get.find(), Get.find()), fenix: true);
    Get.lazyPut<ProfileRepository>(() => ProfileRepositoryImpl(Get.find(), Get.find()), fenix: true);
    Get.lazyPut<RegisterRepository>(() => RegisterRepositoryImpl(Get.find(), Get.find()), fenix: true);
  }
}