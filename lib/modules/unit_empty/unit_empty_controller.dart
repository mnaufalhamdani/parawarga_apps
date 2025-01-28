// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/data/repository/area_repository.dart';
import 'package:parawarga_apps/models/response/area_unit_model.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';

class UnitEmptyController extends GetxController{
  UnitEmptyController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    getEmptyUnit();
  }

  final AreaRepository repository;
  final emptyUnitState = Rx(ResponseState<List<AreaUnitModel>>());

  Future<void> getEmptyUnit() async {
    try {
      emptyUnitState.value = ResponseState.loading();

      final response = await repository.getEmptyUnit();

      emptyUnitState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      emptyUnitState.value = ResponseState.failed(e);
    }
  }
}
