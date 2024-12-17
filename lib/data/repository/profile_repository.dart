// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:parawarga_apps/data/entities/user/user.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../config/local/database_config.dart';
import '../../core/failure_response.dart';
import '../../utils/strings.dart';
import '../provider/login_provider.dart';

//domain - repository
abstract class ProfileRepository {
  Future<UserEntity> getUserActive();

  Future<bool> logout();
}

//data - repository
class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl(this.provider, this.databaseConfig);

  final LoginProvider provider;
  final DatabaseConfig databaseConfig;

  @override
  Future<UserEntity> getUserActive() async {
    final localUser = await databaseConfig.profileDao.getUser();
    if (localUser.isEmpty) {
      throw FailureResponse(message: msgNotFound);
    }

    final localArea = await databaseConfig.areaDao.getArea();
    if (localArea.isEmpty) {
      Get.offAllNamed(Routes.login);
      showStandardSnackbar(Get.context!, TypeMessage.error, message: msgAreaNotFound);
    }

    return localUser.first;
  }

  @override
  Future<bool> logout() async {
    await databaseConfig.profileDao.deleteAll().catchError((error) {
      throw FailureResponse(message: error);
    });

    await databaseConfig.areaDao.deleteAll().catchError((error) {
      throw FailureResponse(message: error);
    });

    return true;
  }
}
