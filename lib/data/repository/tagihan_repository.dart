// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/models/domain/user_area_domain.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../config/local/database_config.dart';
import '../../models/domain/tagihan_domain.dart';
import '../../models/response/tagihan_detail_model.dart';
import '../../models/response/tagihan_model.dart';
import '../../utils/strings.dart';
import '../provider/tagihan_provider.dart';

//domain - repository
abstract class TagihanRepository {
  Future<String> getToken();
  Future<UserAreaDomain> getUserActive();

  Future<List<TagihanModel>> getTagihan();
  Future<TagihanDetailModel> getTagihanDetail(String id);
  Future<GeneralModel> saveTagihanHistory(TagihanHistoryDomain domain);
}

//data - repository
class TagihanRepositoryImpl extends TagihanRepository {
  TagihanRepositoryImpl(this.provider, this.databaseConfig);

  final TagihanProvider provider;
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
  Future<List<TagihanModel>> getTagihan() async {
    return await provider.getTagihan(token: await getToken());
  }

  @override
  Future<TagihanDetailModel> getTagihanDetail(String id) async {
    return await provider.getTagihanDetail(
      token: await getToken(),
      id: id
    );
  }

  @override
  Future<GeneralModel> saveTagihanHistory(TagihanHistoryDomain domain) async {
    final user = await getUserActive();
    domain.created_by = user.userEntity.id;

    final json = jsonEncode(domain).toString();
    return await provider.saveTagihanHistory(
      token: await getToken(),
      json: json
    );
  }
}
