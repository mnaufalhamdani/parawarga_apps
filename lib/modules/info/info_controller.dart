// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/data/repository/information_repository.dart';
import 'package:parawarga_apps/models/response/information_model.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';

class InfoController extends GetxController{
  InfoController({
    required this.repository,
  });

  final InformationRepository repository;
  final infoState = Rx(ResponseState<List<InformationModel>>());

  Future<void> getInformation() async {
    try {
      infoState.value = ResponseState.loading();

      final response = await repository.getInformation();

      infoState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      infoState.value = ResponseState.failed(e);
    }
  }
}
