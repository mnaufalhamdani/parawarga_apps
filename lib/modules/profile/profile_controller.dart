// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/data/entities/user/user.dart';
import 'package:parawarga_apps/data/repository/profile_repository.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';

class ProfileController extends GetxController{
  ProfileController({
    required this.repository,
  });

  final ProfileRepository repository;

  final logoutState = Rx(ResponseState<bool>());
  final userState = Rx(ResponseState<UserEntity>());

  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(2, (index) => TextEditingController());
  final initLoading = false.obs;
  final initMessage = "".obs;
  final initVoting = 4.obs;
  final listData = listExample.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await checkUser();
  }

  Future<void> checkUser() async {
    try {
      userState.value = ResponseState.loading();
      final response = await repository.getUserActive();
      userState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      userState.value = ResponseState.failed(e);
    }
  }

  Future<void> logout() async {
    try {
      logoutState.value = ResponseState.loading();

      final response = await repository.logout();

      logoutState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      logoutState.value = ResponseState.failed(e);
    }
  }
}
