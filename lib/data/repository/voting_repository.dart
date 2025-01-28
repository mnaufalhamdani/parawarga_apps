// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/data/provider/voting_provider.dart';
import 'package:parawarga_apps/models/domain/user_area_domain.dart';
import 'package:parawarga_apps/models/domain/voting_domain.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/voting_detail_model.dart';
import 'package:parawarga_apps/models/response/voting_model.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../config/local/database_config.dart';
import '../../utils/strings.dart';

//domain - repository
abstract class VotingRepository {
  Future<String> getToken();
  Future<UserAreaDomain> getUserActive();

  Future<List<VotingModel>> getVoting();
  Future<VotingDetailModel> getVotingDetail(String id);
  Future<GeneralModel> saveVoted(VotingModel model, String value);
}

//data - repository
class VotingRepositoryImpl extends VotingRepository {
  VotingRepositoryImpl(this.provider, this.databaseConfig);

  final VotingProvider provider;
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
  Future<List<VotingModel>> getVoting() async {
    return await provider.getVoting(token: await getToken());
  }

  @override
  Future<VotingDetailModel> getVotingDetail(String id) async {
    return await provider.getVotingDetail(
      token: await getToken(),
      id: id
    );
  }

  @override
  Future<GeneralModel> saveVoted(VotingModel model, String value) async {
    final userActive = await getUserActive();
    final domain = SaveVotedDomain(
      voting_id: model.id,
      user_id: userActive.userEntity.id,
      urutan: value
    );

    final json = jsonEncode(domain).toString();
    return await provider.saveVoted(token: await getToken(), json: json);
  }
}
