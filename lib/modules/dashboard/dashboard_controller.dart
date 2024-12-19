// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/data/repository/dashboard_repository.dart';
import 'package:parawarga_apps/models/response/view_dashboard_model.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';

class DashboardController extends GetxController{
  DashboardController({
    required this.repository,
  });

  final DashboardRepository repository;
  
  final dashboardState = Rx(ResponseState<ViewDashboardModel>());
  Future<void> getViewDashboard() async {
    try {
      dashboardState.value = ResponseState.loading();
      await repository.getViewDashboard().then((model) {
        dashboardState.value = ResponseState.success(model);
      });
    }on FailureResponse catch(e) {
      dashboardState.value = ResponseState.failed(e);
    }
  }
}
