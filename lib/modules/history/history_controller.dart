// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/data/repository/history_repository.dart';
import 'package:parawarga_apps/models/response/history_model.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';

class HistoryController extends GetxController{
  HistoryController({
    required this.repository,
  });

  final HistoryRepository repository;
  final historyState = Rx(ResponseState<List<HistoryModel>>());

  Future<void> getHistory() async {
    try {
      historyState.value = ResponseState.loading();

      final response = await repository.getHistory();

      historyState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      historyState.value = ResponseState.failed(e);
    }
  }
}
