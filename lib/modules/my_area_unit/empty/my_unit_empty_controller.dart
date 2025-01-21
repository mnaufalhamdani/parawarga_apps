// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parawarga_apps/models/domain/area_domain.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/my_unit_empty_model.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../core/constants.dart';
import '../../../core/data_state.dart';
import '../../../core/failure_response.dart';
import '../../../data/repository/area_repository.dart';
import 'my_unit_empty_page.dart';

class MyUnitEmptyController extends GetxController{
  MyUnitEmptyController({
    required this.repository,
  });

  final AreaRepository repository;

  final unitId = Get.arguments[MyUnitEmptyPage.argUnitId] as String;
  final unitName = Get.arguments[MyUnitEmptyPage.argUnitName] as String;

  @override
  void onInit() {
    super.onInit();
    getMyUnitEmpty();
  }

  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(3, (index) => TextEditingController());
  final myUnitEmptyDomain = Rx(MyUnitEmptyDomain());

  final myUnitEmptyState = Rx(ResponseState<MyUnitEmptyModel>());
  Future<void> getMyUnitEmpty() async {
    try {
      myUnitEmptyState.value = ResponseState.loading();

      final response = await repository.getMyUnitEmpty(unitId);

      editingControllers[0].text = response.startDateName ?? "";
      editingControllers[1].text = response.endDateName ?? "";
      editingControllers[2].text = response.message ?? "";

      myUnitEmptyDomain.value = MyUnitEmptyDomain(
        id: response.id,
        unit_id: response.unitId,
        name: response.name,
        start_date: response.startDate,
        end_date: response.endDate,
        message: response.message
      );

      myUnitEmptyState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      myUnitEmptyState.value = ResponseState.failed(e);
    }
  }

  final saveState = Rx(ResponseState<GeneralModel>());
  Future<void> saveManageEmptyUnit() async {
    try {
      if (myUnitEmptyDomain.value.end_date != null){
        final startDate = DateFormat("yyyy-MM-dd").parse(myUnitEmptyDomain.value.start_date.toString());
        final endDate = DateFormat("yyyy-MM-dd").parse(myUnitEmptyDomain.value.end_date.toString());
        if (dateBetween(startDate, endDate) < 0){
          throw FailureResponse(message: msgDateBetween);
        }
      }

      saveState.value = ResponseState.loading();

      myUnitEmptyDomain.value.unit_id = unitId;
      myUnitEmptyDomain.value.name = unitName;
      myUnitEmptyDomain.value.message = editingControllers[2].text;
      final response = await repository.saveManageEmptyUnit(myUnitEmptyDomain.value);

      saveState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      saveState.value = ResponseState.failed(e);
    }
  }
}
