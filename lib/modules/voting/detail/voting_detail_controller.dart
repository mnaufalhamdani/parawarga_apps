// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/voting_detail_model.dart';
import 'package:parawarga_apps/modules/voting/detail/voting_detail_page.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../core/data_state.dart';
import '../../../core/failure_response.dart';
import '../../../data/repository/voting_repository.dart';

class VotingDetailController extends GetxController{
  VotingDetailController({
    required this.repository,
  });

  final id = Get.arguments[VotingDetailPage.argId] as String;

  final VotingRepository repository;
  final votingState = Rx(ResponseState<VotingDetailModel>());
  final votersList = Rx(List<Voter>.empty(growable: true));//is duplicate problem
  final votersLabel = Rx("");
  final votersClicked = Rxn<int>(null);//null = all voters, 0, tidak vote, >= 1 specific data

  // final formKey = GlobalKey<FormState>();
  // final editingControllers = List.generate(2, (index) => TextEditingController());
  // final initLoading = false.obs;
  // final initMounted = false.obs;
  // final initMessage = "".obs;
  // final initLabelOfVoters = labelTotalMember.obs;
  // final listData = listVotingDetail.obs;
  // final scrollController = ScrollController().obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   Timer.periodic(const Duration(milliseconds: 500), (timer) {
  //     if(initMounted.value == false){
  //       initMounted.value = true;
  //       scrollController.value.jumpTo(scrollController.value.position.minScrollExtent);
  //     }else {
  //       timer.cancel();
  //     }
  //   });
  // }

  Future<void> getVotingDetail() async {
    try {
      votingState.value = ResponseState.loading();

      final response = await repository.getVotingDetail(id);

      // votersList.value = response.voters;
      votersLabel.value = labelTotalMember;
      votingState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      votingState.value = ResponseState.failed(e);
    }
  }
}
