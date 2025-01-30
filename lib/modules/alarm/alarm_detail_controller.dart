// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/data/repository/alarm_repository.dart';
import 'package:parawarga_apps/models/response/alarm_detail_model.dart';
import 'package:parawarga_apps/modules/alarm/alarm_detail_page.dart';

import '../../../core/data_state.dart';
import '../../../core/failure_response.dart';

class AlarmDetailController extends GetxController{
  AlarmDetailController({
    required this.repository,
  });

  final id = Get.arguments[AlarmDetailPage.argId] as String;
  final AlarmRepository repository;
  final alarmState = Rx(ResponseState<AlarmDetailModel>());

  Future<void> getAlarmDetail() async {
    try {
      alarmState.value = ResponseState.loading();

      final response = await repository.getAlarmDetail(id);

      alarmState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      alarmState.value = ResponseState.failed(e);
    }
  }
}
