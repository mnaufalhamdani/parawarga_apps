// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/data/entities/auth_menu/auth_menu.dart';
import 'package:parawarga_apps/data/repository/dashboard_repository.dart';
import 'package:parawarga_apps/models/domain/alarm_domain.dart';
import 'package:parawarga_apps/models/response/view_dashboard_model.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../core/constants.dart';
import '../../core/data_state.dart';
import '../../core/failure_response.dart';
import '../../models/domain/user_area_domain.dart';
import '../../models/response/general_model.dart';

class DashboardController extends GetxController{
  DashboardController({
    required this.repository,
  });

  final DashboardRepository repository;

  final authMenuState = Rx(ResponseState<List<AuthMenuEntity>>());
  final userAreaState = Rx(ResponseState<UserAreaDomain>());
  final dashboardState = Rx(ResponseState<ViewDashboardModel>());

  Future<void> getViewDashboard() async {
    try {
      dashboardState.value = ResponseState.loading();
      await repository.getAuthMenu().then((value) {
        authMenuState.value = ResponseState.success(value);
      });

      await repository.getUserActive().then((value) {
        userAreaState.value = ResponseState.success(value);
      });

      await repository.getViewDashboard().then((value) {
        dashboardState.value = ResponseState.success(value);
      });
    }on FailureResponse catch(e) {
      showStandardSnackbar(Get.context!, TypeMessage.error, message: e.message.toString());
      dashboardState.value = ResponseState.failed(e);
    }
  }

  final inputAlarmDomain = Rx(InputAlarmDomain());
  final saveAlarmState = Rx(ResponseState<GeneralModel>());
  Future<void> saveAlarm(int areaId, String message) async {
    try {
      saveAlarmState.value = ResponseState.loading();

      final position = await getLocation();

      final address = await getAddressLocation(position?.latitude ?? 0, position?.longitude ?? 0);
      inputAlarmDomain.value.area_id = areaId.toString();
      inputAlarmDomain.value.message = message;
      inputAlarmDomain.value.latitude = position?.latitude.toString();
      inputAlarmDomain.value.longitude = position?.longitude.toString();
      inputAlarmDomain.value.generate_location = address;
      final response = await repository.saveAlarm(inputAlarmDomain.value);

      saveAlarmState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      saveAlarmState.value = ResponseState.failed(e);
    }
  }
}
