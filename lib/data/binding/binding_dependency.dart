import 'package:get/get.dart';
import 'package:parawarga_apps/modules/arisan/arisan_controller.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_controller.dart';
import 'package:parawarga_apps/modules/dashboard/dashboard_controller.dart';
import 'package:parawarga_apps/modules/login/login_controller.dart';
import 'package:parawarga_apps/modules/profile/profile_controller.dart';
import 'package:parawarga_apps/modules/register/register_controller.dart';
import 'package:parawarga_apps/modules/splash/splash_controller.dart';
import 'package:parawarga_apps/modules/tagihan/detail/tagihan_detail_controller.dart';
import 'package:parawarga_apps/modules/tagihan/tagihan_controller.dart';
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
  }
}