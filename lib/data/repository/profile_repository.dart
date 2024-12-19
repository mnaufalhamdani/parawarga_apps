// ignore_for_file: prefer_const_constructors
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../config/local/database_config.dart';
import '../../core/failure_response.dart';
import '../../models/domain/user_area_domain.dart';
import '../../utils/strings.dart';
import '../provider/login_provider.dart';

//domain - repository
abstract class ProfileRepository {
  Future<UserAreaDomain> getUserActive();

  Future<bool> logout();
}

//data - repository
class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl(this.provider, this.databaseConfig);

  final LoginProvider provider;
  final DatabaseConfig databaseConfig;

  @override
  Future<UserAreaDomain> getUserActive() async {
    final localUser = await databaseConfig.profileDao.getUser();
    if (localUser.isEmpty) {
      Get.offAllNamed(Routes.login);
      return showStandardSnackbar(Get.context!, TypeMessage.error, message: msgNotFound);
    }

    final localArea = await databaseConfig.areaDao.getArea();
    if (localArea.isEmpty) {
      Get.offAllNamed(Routes.login);
      return showStandardSnackbar(Get.context!, TypeMessage.error, message: msgAreaNotFound);
    }

    return UserAreaDomain(userEntity: localUser.first, areaEntity: localArea);
  }

  @override
  Future<bool> logout() async {
    await databaseConfig.profileDao.deleteAll().catchError((error) {
      throw FailureResponse(message: error);
    });

    await databaseConfig.areaDao.deleteAll().catchError((error) {
      throw FailureResponse(message: error);
    });

    final secureStorage = FlutterSecureStorage();
    await secureStorage.deleteAll();

    return true;
  }
}
