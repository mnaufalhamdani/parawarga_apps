// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/data_state.dart';
import 'package:parawarga_apps/data/repository/register_repository.dart';
import 'package:parawarga_apps/models/domain/register_warga_domain.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../core/failure_response.dart';

class RegisterController extends GetxController{
  RegisterController({
    required this.repository,
  });

  final RegisterRepository repository;

  @override
  void onInit() {
    super.onInit();
    // monitorConnection(Get.context!);
  }

  //kode generate area, no.ktp, name, alamat ktp, alamat domisili, email, phone
  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(8, (index) => TextEditingController());
  final registerState = Rx(ResponseState<RegisterWargaDomain>());

  //input kode generate area
  // final formKeyFirst = GlobalKey<FormState>();
  // final editingControllersFirst = List.generate(1, (index) => TextEditingController());
  // final checkAreaState = Rx(ResponseState<RegisterWargaDomain>());

  // no.ktp
  // final formKeySecond = GlobalKey<FormState>();
  // final editingControllersSecond = List.generate(1, (index) => TextEditingController());
  // final Rx<ResponseStateOld> checkIdState = Rx(ResponseDefault());

  //name, alamat ktp, alamat domisili, email, phone
  // final formKeyThird = GlobalKey<FormState>();
  // final editingControllersThird = List.generate(5, (index) => TextEditingController());
  // final Rx<ResponseStateOld> registerState = Rx(ResponseDefault());

  final registerWargaDomain = Rx(RegisterWargaDomain());
  final activeStep = Rx(0);

  Future<void> checkArea() async {
    try {
      registerState.value = ResponseState.loading();
      registerWargaDomain.value.area_generate = null;

      await repository.verifyEncodeArea(
          editingControllers[0].text.toString()
      ).then((model) {
        log("checkArea");
        registerWargaDomain.value.area_generate = model.area_generate;
        registerWargaDomain.value.resultMsgArea =
        "\n${model.area_name}"
            "\n${model.kelurahan_name}, ${model.kecamatan_name}, ${model.kabupaten_name}, ${model.provinsi_name}";
        registerState.value = ResponseState.success(registerWargaDomain.value);
      });
    }on FailureResponse catch(e) {
      registerState.value = ResponseState.failed(e);
      showStandardSnackbar(Get.context!, TypeMessage.error, message: e.message.toString(), paddingBottom: 60);
    }
  }

  Future<void> checkId() async {
    try {
      registerState.value = ResponseState.loading();
      registerWargaDomain.value.nik = null;

      await repository.verifyNik(editingControllers[1].text.toString()).then((model) {
        registerWargaDomain.value.nik = editingControllers[1].text.toString();
        registerWargaDomain.value.resultMsgId = "\n${model.message.toString()}";
      });

      registerState.value = ResponseState.success(registerWargaDomain.value);
    }on FailureResponse catch(e) {
      const text = "\nHubungi kami jika Anda merasa tidak pernah mendaftar di sistem kami.";
      registerWargaDomain.value.resultMsgId = "\n${e.message.toString()}$text";
      registerState.value = ResponseState.success(registerWargaDomain.value);
    }
  }

  Future<void> registerAsync() async {
    try {
      registerState.value = ResponseState.loading();
      final name = editingControllers[2].text.toString();
      final address = editingControllers[3].text.toString();
      final addressSecond = editingControllers[4].text.toString();
      final email = editingControllers[5].text.toString();
      final phone = editingControllers[6].text.toString();
      final password = editingControllers[7].text.toString();
      registerWargaDomain.value.name = name;
      registerWargaDomain.value.address_ktp = address;
      registerWargaDomain.value.address_domisili = addressSecond;
      registerWargaDomain.value.email = email;
      registerWargaDomain.value.username = email;
      registerWargaDomain.value.phone = phone;
      registerWargaDomain.value.password = password;

      await repository.register(registerWargaDomain.value).then((response) {
        registerState.value = ResponseState.success(registerWargaDomain.value);
      });
    }on FailureResponse catch(e) {
      registerState.value = ResponseState.failed(e);
    }
  }
}
