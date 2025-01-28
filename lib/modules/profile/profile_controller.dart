// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/data/repository/profile_repository.dart';
import 'package:parawarga_apps/models/domain/user_area_domain.dart';

import '../../core/data_state.dart';
import '../../core/failure_response.dart';
import '../../data/entities/auth_menu/auth_menu.dart';

class ProfileController extends GetxController{
  ProfileController({
    required this.repository,
  });

  final ProfileRepository repository;

  final authMenuState = Rx(ResponseState<List<AuthMenuEntity>>());
  final logoutState = Rx(ResponseState<bool>());
  final userState = Rx(ResponseState<UserAreaDomain>());

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

      await repository.getAuthMenu().then((value) {
        authMenuState.value = ResponseState.success(value);
      });

      await repository.getUserActive().then((value) {
        userState.value = ResponseState.success(value);
      });
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
