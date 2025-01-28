// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/data/entities/auth_menu/auth_menu.dart';
import 'package:parawarga_apps/data/provider/dashboard_provider.dart';
import 'package:parawarga_apps/models/domain/alarm_domain.dart';
import 'package:parawarga_apps/models/domain/user_area_domain.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../config/local/database_config.dart';
import '../../models/response/view_dashboard_model.dart';
import '../../utils/strings.dart';

//domain - repository
abstract class DashboardRepository {
  Future<String> getToken();
  Future<UserAreaDomain> getUserActive();
  Future<List<AuthMenuEntity>> getAuthMenu();

  Future<ViewDashboardModel> getViewDashboard();
  Future<GeneralModel> saveAlarm(InputAlarmDomain domain);
}

//data - repository
class DashboardRepositoryImpl extends DashboardRepository {
  DashboardRepositoryImpl(this.provider, this.databaseConfig);

  final DashboardProvider provider;
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
  Future<List<AuthMenuEntity>> getAuthMenu() async {
    return await databaseConfig.authMenuDao.getAuthMenuByMenu("dashboard");
  }

  @override
  Future<ViewDashboardModel> getViewDashboard() async {
    return await provider.getViewDashboard(token: await getToken());
  }

  @override
  Future<GeneralModel> saveAlarm(InputAlarmDomain domain) async {
    final user = await getUserActive();
    domain.created_by = user.userEntity.id;

    final json = jsonEncode(domain).toString();
    return await provider.saveAlarm(
      token: await getToken(),
      json: json
    );
  }
}
