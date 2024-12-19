// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parawarga_apps/data/provider/dashboard_provider.dart';
import 'package:parawarga_apps/models/domain/user_area_domain.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../config/local/database_config.dart';
import '../../models/response/view_dashboard_model.dart';
import '../../utils/strings.dart';

//domain - repository
abstract class DashboardRepository {
  Future<UserAreaDomain> getUserActive();

  Future<ViewDashboardModel> getViewDashboard();
}

//data - repository
class DashboardRepositoryImpl extends DashboardRepository {
  DashboardRepositoryImpl(this.provider, this.databaseConfig);

  final DashboardProvider provider;
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
  Future<ViewDashboardModel> getViewDashboard() async {
    final entity = await getUserActive();
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final areaArray = entity.areaEntity?.map((element) => element.area_id).toList().join(",");

    return await provider.getViewDashboard(
      token: entity.userEntity.token.toString(),
      areaArray: areaArray,
      date: date
    );
  }
}
