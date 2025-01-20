// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/my_area_unit_model.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';
import '../../data/repository/area_repository.dart';
import '../../data/repository/register_repository.dart';

class MyAreaController extends GetxController{
  MyAreaController({
    required this.repository,
    required this.repositoryRegister,
  });

  @override
  void onInit() {
    super.onInit();
    getMyUnit();
  }

  final AreaRepository repository;
  final RegisterRepository repositoryRegister;

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

  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(1, (index) => TextEditingController());
  final checkAreaState = Rx(ResponseState<String>());

  Future<void> checkArea() async {
    try {
      checkAreaState.value = ResponseState.loading();

      await repositoryRegister.verifyEncodeArea(
          editingControllers[0].text.toString()
      ).then((model) {
        final message =
        "\n${model.area_name}"
            "\n${model.kelurahan_name}, ${model.kecamatan_name}, ${model.kabupaten_name}, ${model.provinsi_name}";
        checkAreaState.value = ResponseState.success(message);
      });
    }on FailureResponse catch(e) {
      checkAreaState.value = ResponseState.failed(e);
    }
  }

  final saveOrRemoveState = Rx(ResponseState<GeneralModel>());

  Future<void> saveMyArea() async {
    try {
      saveOrRemoveState.value = ResponseState.loading();

      final response = await repository.saveMyArea(editingControllers[0].text.toString());

      saveOrRemoveState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      saveOrRemoveState.value = ResponseState.failed(e);
    }
  }

  Future<void> removeMyUnit(String unitId) async {
    try {
      saveOrRemoveState.value = ResponseState.loading();

      final response = await repository.removeMyUnit(unitId);

      saveOrRemoveState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      saveOrRemoveState.value = ResponseState.failed(e);
    }
  }
}
