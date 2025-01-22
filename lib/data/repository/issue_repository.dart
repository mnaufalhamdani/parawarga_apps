// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/data/provider/issue_provider.dart';
import 'package:parawarga_apps/models/domain/issue_domain.dart';
import 'package:parawarga_apps/models/domain/user_area_domain.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/issue_detail_model.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../config/local/database_config.dart';
import '../../models/response/issue_model.dart';
import '../../utils/strings.dart';

//domain - repository
abstract class IssueRepository {
  Future<String> getToken();
  Future<UserAreaDomain> getUserActive();

  Future<List<IssueModel>> getIssue();
  Future<IssueDetailModel> getIssueDetail(String id);
  Future<GeneralModel> saveIssue(InputIssueDomain domain);
}

//data - repository
class IssueRepositoryImpl extends IssueRepository {
  IssueRepositoryImpl(this.provider, this.databaseConfig);

  final IssueProvider provider;
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
  Future<List<IssueModel>> getIssue() async {
    return await provider.getIssue(token: await getToken());
  }

  @override
  Future<IssueDetailModel> getIssueDetail(String id) async {
    return await provider.getIssueDetail(
      token: await getToken(),
      id: id
    );
  }

  @override
  Future<GeneralModel> saveIssue(InputIssueDomain domain) async {
    final user = await getUserActive();
    domain.created_by = user.userEntity.id;

    final json = jsonEncode(domain).toString();
    return await provider.saveIssue(
      token: await getToken(),
      json: json
    );
  }
}
