// ignore_for_file: prefer_const_constructors
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/data/provider/area_provider.dart';
import 'package:parawarga_apps/models/domain/user_area_domain.dart';
import 'package:parawarga_apps/models/response/my_area_unit_model.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../config/local/database_config.dart';
import '../../models/response/area_unit_model.dart';
import '../../utils/strings.dart';

//domain - repository
abstract class AreaRepository {
  Future<String> getToken();
  Future<UserAreaDomain> getUserActive();

  Future<List<AreaUnitModel>> getEmptyUnit();
  Future<List<MyAreaUnitModel>> getMyAreaUnit();
}

//data - repository
class AreaRepositoryImpl extends AreaRepository {
  AreaRepositoryImpl(this.provider, this.databaseConfig);

  final AreaProvider provider;
  final DatabaseConfig databaseConfig;

  @override
  Future<String> getToken() async {
    final secureStorage = FlutterSecureStorage();
    final token = await secureStorage.read(key: 'jwt_token');
    return token ?? "unknown";
  }

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
  Future<List<AreaUnitModel>> getEmptyUnit() async {
    return await provider.getAreaUnit(
      token: await getToken(),
      empty: "yes"
    );
  }

  @override
  Future<List<MyAreaUnitModel>> getMyAreaUnit() async {
    return await provider.getMyAreaUnit(
      token: await getToken()
    );
  }
}
