// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/data/repository/issue_repository.dart';
import 'package:parawarga_apps/models/response/issue_model.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';

class IssueController extends GetxController{
  IssueController({
    required this.repository,
  });

  final IssueRepository repository;
  final issueState = Rx(ResponseState<List<IssueModel>>());

  Future<void> getIssue() async {
    try {
      issueState.value = ResponseState.loading();

      final response = await repository.getIssue();

      issueState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      issueState.value = ResponseState.failed(e);
    }
  }
}
