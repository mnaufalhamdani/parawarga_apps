// ignore_for_file: prefer_const_constructors
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parawarga_apps/data/provider/information_provider.dart';
import 'package:parawarga_apps/models/domain/user_area_domain.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../config/local/database_config.dart';
import '../../models/response/information_model.dart';
import '../../utils/strings.dart';

//domain - repository
abstract class InformationRepository {
  Future<String> getToken();
  Future<UserAreaDomain> getUserActive();

  Future<List<InformationModel>> getInformation();
  Future<InformationModel> getInformationDetail(String id);
}

//data - repository
class InformationRepositoryImpl extends InformationRepository {
  InformationRepositoryImpl(this.provider, this.databaseConfig);

  final InformationProvider provider;
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
  Future<List<InformationModel>> getInformation() async {
    final entity = await getUserActive();
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final areaArray = entity.areaEntity?.map((element) => element.area_id).toList().join(",");

    return await provider.getInformation(
      token: await getToken(),
      areaArray: areaArray,
      date: date
    );
  }

  @override
  Future<InformationModel> getInformationDetail(String id) async {
    return await provider.getInformationDetail(
      token: await getToken(),
      id: id
    );
  }
}
