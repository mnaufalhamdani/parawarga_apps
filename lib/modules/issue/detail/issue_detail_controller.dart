// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/issue_detail_model.dart';
import 'package:parawarga_apps/modules/issue/detail/issue_detail_page.dart';

import '../../../core/data_state.dart';
import '../../../core/failure_response.dart';
import '../../../data/repository/issue_repository.dart';

class IssueDetailController extends GetxController{
  IssueDetailController({
    required this.repository,
  });

  final id = Get.arguments[IssueDetailPage.argId] as String;
  final IssueRepository repository;
  final issueState = Rx(ResponseState<IssueDetailModel>());

  Future<void> getIssueDetail() async {
    try {
      issueState.value = ResponseState.loading();

      final response = await repository.getIssueDetail(id);

      issueState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      issueState.value = ResponseState.failed(e);
    }
  }
}
