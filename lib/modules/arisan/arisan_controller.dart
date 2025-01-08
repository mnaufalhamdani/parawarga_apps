// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/data/repository/arisan_repository.dart';
import 'package:parawarga_apps/models/response/ArisanModel.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';

class ArisanController extends GetxController{
  ArisanController({
    required this.repository,
  });

  final ArisanRepository repository;
  final arisanState = Rx(ResponseState<List<ArisanModel>>());

  Future<void> getArisan() async {
    try {
      arisanState.value = ResponseState.loading();

      final response = await repository.getArisan();

      arisanState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      arisanState.value = ResponseState.failed(e);
    }
  }
}
