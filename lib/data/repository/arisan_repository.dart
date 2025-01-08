// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/data/provider/arisan_provider.dart';
import 'package:parawarga_apps/models/domain/arisan_domain.dart';
import 'package:parawarga_apps/models/domain/user_area_domain.dart';
import 'package:parawarga_apps/models/response/ArisanDetailModel.dart';
import 'package:parawarga_apps/models/response/ArisanModel.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../config/local/database_config.dart';
import '../../utils/strings.dart';

//domain - repository
abstract class ArisanRepository {
  Future<String> getToken();
  Future<UserAreaDomain> getUserActive();

  Future<List<ArisanModel>> getArisan();
  Future<ArisanDetailModel> getArisanDetail(String id);
  Future<GeneralModel> saveArisanWinner(ArisanWinnerDomain domain);
}

//data - repository
class ArisanRepositoryImpl extends ArisanRepository {
  ArisanRepositoryImpl(this.provider, this.databaseConfig);

  final ArisanProvider provider;
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
  Future<List<ArisanModel>> getArisan() async {
    return await provider.getArisan(token: await getToken());
  }

  @override
  Future<ArisanDetailModel> getArisanDetail(String id) async {
    return await provider.getArisanDetail(
      token: await getToken(),
      id: id
    );
  }

  @override
  Future<GeneralModel> saveArisanWinner(ArisanWinnerDomain domain) async {
    final user = await getUserActive();
    domain.created_by = user.userEntity.id;

    final json = jsonEncode(domain).toString();
    return await provider.saveArisanWinner(
      token: await getToken(),
      json: json
    );
  }
}
