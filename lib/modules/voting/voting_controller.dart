// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/data/repository/voting_repository.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/voting_model.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';

class VotingController extends GetxController{
  VotingController({
    required this.repository,
  });

  final VotingRepository repository;
  final votingState = Rx(ResponseState<List<VotingModel>>());
  final saveVotedState = Rx(ResponseState<GeneralModel>());

  Future<void> getVoting() async {
    try {
      votingState.value = ResponseState.loading();

      final response = await repository.getVoting();

      votingState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      votingState.value = ResponseState.failed(e);
    }
  }

  Future<void> saveVoted(VotingModel model, String value) async {
    try {
      saveVotedState.value = ResponseState.loading();

      final response = await repository.saveVoted(model, value);

      saveVotedState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      saveVotedState.value = ResponseState.failed(e);
    }
  }
}
