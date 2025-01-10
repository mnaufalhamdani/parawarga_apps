// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/response/tagihan_model.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';
import '../../data/repository/tagihan_repository.dart';

class TagihanController extends GetxController{
  TagihanController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    getTagihan();
  }

  final TagihanRepository repository;
  final tagihanState = Rx(ResponseState<List<TagihanModel>>());

  Future<void> getTagihan() async {
    try {
      tagihanState.value = ResponseState.loading();

      final response = await repository.getTagihan();

      tagihanState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      tagihanState.value = ResponseState.failed(e);
    }
  }
}
