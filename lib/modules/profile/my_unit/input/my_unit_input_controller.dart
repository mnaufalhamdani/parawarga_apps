// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/domain/area_domain.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/my_area_unit_model.dart';

import '../../../../core/data_state.dart';
import '../../../../core/failure_response.dart';
import '../../../../data/repository/area_repository.dart';
import 'my_unit_input_page.dart';

class MyUnitInputController extends GetxController{
  MyUnitInputController({
    required this.repository,
  });

  final AreaRepository repository;

  final areaId = Get.arguments[MyUnitInputPage.argAreaId] as String;
  final unit = Get.arguments[MyUnitInputPage.argUnit] as Unit?;

  @override
  Future<void> onInit() async {
    super.onInit();
    await checkPermissionStatus();
    /** if edit data */
    if (unit != null) {
      myUnitDomain.value.id = unit!.id;
      isContract.value = unit?.contract ?? false;
      editingControllers[0].text = unit?.name ?? "";
      editingControllers[1].text = unit?.additionalDesc ?? "";
    }
  }

  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(2, (index) => TextEditingController());
  final myUnitDomain = Rx(MyUnitDomain());
  final isContract = Rx(false);
  final isLocated = Rx(false);
  final saveOrRemoveState = Rx(ResponseState<GeneralModel>());

  Future<void> saveMyUnit() async {
    try {
      saveOrRemoveState.value = ResponseState.loading();

      myUnitDomain.value.area_id = areaId;
      myUnitDomain.value.name = editingControllers[0].text.toString();
      myUnitDomain.value.additional_desc = editingControllers[1].text.toString();
      myUnitDomain.value.contract = (isContract.value) ? 1 : 0;
      final response = await repository.saveMyUnit(myUnitDomain.value);

      saveOrRemoveState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      saveOrRemoveState.value = ResponseState.failed(e);
    }
  }
}
