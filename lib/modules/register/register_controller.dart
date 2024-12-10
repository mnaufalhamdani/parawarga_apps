// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/data_state.dart';
import 'package:parawarga_apps/models/domain/register_warga_domain.dart';

import '../../core/failure_response.dart';

class RegisterController extends GetxController{
  //kode generate area, no.ktp, name, alamat ktp, alamat domisili, email, phone
  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(7, (index) => TextEditingController());
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
      registerWargaDomain.value.area_code_generate = null;

      final areaCode = editingControllers[0].text.toString();
      registerWargaDomain.value.area_code_generate = areaCode;
      // await repository.getLogin(
      //     editingControllers[0].text.toString()
      // );

      registerWargaDomain.value.resultMsgArea =
      "\nRT. 001 / RW. 003"
          "\nKelurahan Tulusrejo, Kecamatan Lowokwaru, Kota Malang, Jawa Timur";
      registerWargaDomain.value.resultMsgResponsible =
      "\nMuhammad Naufal Hamdani";
      registerState.value = ResponseState.success(registerWargaDomain.value);

    }on FailureResponse catch(e) {
      registerState.value = ResponseState.failed(e);
    }
  }

  Future<void> checkId() async {
    try {
      registerState.value = ResponseState.loading();
      final nik = editingControllers[1].text.toString();

      // await repository.getLogin(
      //     editingControllers[0].text.toString()
      // );

      registerWargaDomain.value.nik = nik;
      registerWargaDomain.value.username = nik;
      registerWargaDomain.value.resultMsgId = "\nData Anda belum terdaftar di sistem kami, silahkan melanjutkan pendaftaran Anda dengan No. NIK : $nik.";

      // const text = "\nData Anda telah terdaftar di sistem, silahkan untuk masuk menggunakan data yang telah di daftarkan."
      //     "\nHubungi Call Center kami jika Anda merasa Data Anda di tidak pernah di masukkan di sistem kami.";
      registerState.value = ResponseState.success(registerWargaDomain.value);
    }on FailureResponse catch(e) {
      registerState.value = ResponseState.failed(e);
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
      registerWargaDomain.value.name = name;
      registerWargaDomain.value.address_ktp = address;
      registerWargaDomain.value.address_domisili = addressSecond;
      registerWargaDomain.value.email = email;
      registerWargaDomain.value.phone = phone;

      // await repository.getLogin(
      //     editingControllers[0].text.toString()
      // );

      await Future.delayed(Duration(seconds: 5), () {
        print("register: ${registerWargaDomain.value}");
        registerState.value = ResponseState.success(registerWargaDomain.value);
      });
    }on FailureResponse catch(e) {
      await Future.delayed(Duration(seconds: 5), () {
        registerState.value = ResponseState.failed(e);
      });
    }
  }
}
