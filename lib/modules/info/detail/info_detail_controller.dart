// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/modules/info/detail/info_detail_page.dart';

import '../../../core/data_state.dart';
import '../../../core/failure_response.dart';
import '../../../data/repository/information_repository.dart';
import '../../../models/response/information_model.dart';

class InfoDetailController extends GetxController{
  InfoDetailController({
    required this.repository,
  });

  final id = Get.arguments[InfoDetailPage.argId] as String;
  final InformationRepository repository;
  final infoState = Rx(ResponseState<InformationModel>());

  Future<void> getInformationDetail() async {
    try {
      infoState.value = ResponseState.loading();

      final response = await repository.getInformationDetail(id);

      infoState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      infoState.value = ResponseState.failed(e);
    }
  }
}
