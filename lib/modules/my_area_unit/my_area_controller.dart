// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/my_area_unit_model.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';
import '../../data/repository/area_repository.dart';

class MyAreaController extends GetxController{
  MyAreaController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    getMyUnit();
  }

  final AreaRepository repository;
  final myAreaUnitState = Rx(ResponseState<List<MyAreaUnitModel>>());

  Future<void> getMyUnit() async {
    try {
      myAreaUnitState.value = ResponseState.loading();

      final response = await repository.getMyAreaUnit();

      myAreaUnitState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      myAreaUnitState.value = ResponseState.failed(e);
    }
  }
}
