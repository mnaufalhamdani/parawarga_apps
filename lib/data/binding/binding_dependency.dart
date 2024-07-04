import 'package:get/get.dart';
import 'package:parawarga_apps/modules/login/login_controller.dart';
import 'package:parawarga_apps/modules/splash/splash_controller.dart';


class BindingDependency implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}