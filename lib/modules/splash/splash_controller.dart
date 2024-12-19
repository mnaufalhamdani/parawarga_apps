// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';
import '../../data/entities/user/user.dart';
import '../../data/repository/login_repository.dart';
import '../../routes/app_pages.dart';
import '../../theme/standard_snackbar.dart';

class SplashController extends GetxController{
  SplashController({
    required this.repository,
  });

  final LoginRepository repository;

  final splashState = Rx(ResponseState<UserEntity>());

  void checkSession() async {
    try {
      final response = await repository.getUserActive();
      await repository.login(response.userEntity.username, response.userEntity.password);

      Get.offAllNamed(Routes.dashboard);
    }on FailureResponse catch(e) {
      if (e.message != null) {
        Get.offAllNamed(Routes.login);
        showStandardSnackbar(Get.context!, TypeMessage.error,
            message: e.message.toString(),
            duration: DurationMessage.lengthLong);
      }
    }
  }
}
