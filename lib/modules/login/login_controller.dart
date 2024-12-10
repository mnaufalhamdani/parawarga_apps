// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/data_state.dart';
import 'package:parawarga_apps/data/entities/user/user.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/failure_response.dart';
import '../../data/repository/login_repository.dart';

class LoginController extends GetxController{
  LoginController({
    required this.repository,
  });

  final LoginRepository repository;

  final permission = Permission;
  var permissionStatus = PermissionStatus.denied;

  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(2, (index) => TextEditingController());
  final loginState = Rx(ResponseState<UserEntity>());

  @override
  Future<void> onInit() async {
    super.onInit();

    checkPermissionStatus();
  }

  Future<void> login() async {
    try {
      loginState.value = ResponseState.loading();

      final response = await repository.login(
          editingControllers[0].text.toString(),
          editingControllers[1].text.toString()
      );

      loginState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      loginState.value = ResponseState.failed(e);
    }
  }

  Future<void> checkPermissionStatus() async {
    final status1 = await Permission.storage.status;
    final status2 = await Permission.manageExternalStorage.status;

    if (status1.isDenied || status2.isDenied) {
      await Permission.storage.request();
      await Permission.manageExternalStorage.request();
    }
  }
}
