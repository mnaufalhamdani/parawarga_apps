// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/data_state.dart';
import 'package:parawarga_apps/models/domain/register_warga_domain.dart';

import '../../core/failure_response.dart';

class RegisterController extends GetxController{
  //input kode generate area
  final formKeyFirst = GlobalKey<FormState>();
  final editingControllersFirst = List.generate(1, (index) => TextEditingController());
  final Rx<ResponseState> checkAreaState = Rx(ResponseDefault());

  // no.ktp
  final formKeySecond = GlobalKey<FormState>();
  final editingControllersSecond = List.generate(1, (index) => TextEditingController());
  final Rx<ResponseState> checkIdState = Rx(ResponseDefault());

  //name, alamat ktp, alamat domisili, email, phone
  final formKeyThird = GlobalKey<FormState>();
  final editingControllersThird = List.generate(5, (index) => TextEditingController());
  final Rx<ResponseState> registerState = Rx(ResponseDefault());

  final registerWargaDomain = Rx(RegisterWargaDomain());
  final activeStep = Rx(0);

  Future<void> checkArea() async {
    try {
      checkAreaState.value = ResponseLoading();
      registerWargaDomain.value.area_code_generate = null;

      final areaCode = editingControllersFirst[0].text.toString();
      registerWargaDomain.value.area_code_generate = areaCode;
      // await repository.getLogin(
      //     editingControllers[0].text.toString()
      // );

      registerWargaDomain.value.resultArea =
      "\nRT. 001 / RW. 003"
          "\nKelurahan Tulusrejo, Kecamatan Lowokwaru, Kota Malang, Jawa Timur";
      registerWargaDomain.value.resultResponsible =
      "\nMuhammad Naufal Hamdani";
      checkAreaState.value = ResponseSuccess(registerWargaDomain.value);

      // switch (checkAreaState.value) {
      //   case ResponseLoading():
      //     print('ResponseLoading');
      //     break;
      //   case ResponseSuccess():
      //     print('ResponseSuccess');
      //     break;
      //   case ResponseFailed():
      //     print('ResponseFailed');
      //     break;
      //   case ResponseDefault():
      //     print('ResponseDefault');
      //     break;
      // }
    }on FailureResponse catch(e) {
      checkAreaState.value = ResponseFailed(e);
    }
  }

  Future<void> checkId() async {
    try {
      checkIdState.value = ResponseLoading();
      final nik = editingControllersSecond[0].text.toString();

      // await repository.getLogin(
      //     editingControllers[0].text.toString()
      // );

      registerWargaDomain.value.nik = nik;
      registerWargaDomain.value.username = nik;
      var text = "\nData Anda belum terdaftar di sistem kami, silahkan melanjutkan pendaftaran Anda dengan No. NIK : $nik.";

      // const text = "\nData Anda telah terdaftar di sistem, silahkan untuk masuk menggunakan data yang telah di daftarkan."
      //     "\nHubungi Call Center kami jika Anda merasa Data Anda di tidak pernah di masukkan di sistem kami.";
      checkIdState.value = ResponseSuccess(text);
    }on FailureResponse catch(e) {
      checkIdState.value = ResponseFailed(e);
    }
  }

  Future<void> registerAsync() async {
    try {
      registerState.value = ResponseLoading();
      final name = editingControllersThird[0].text.toString();
      final address = editingControllersThird[1].text.toString();
      final addressSecond = editingControllersThird[2].text.toString();
      final email = editingControllersThird[3].text.toString();
      final phone = editingControllersThird[4].text.toString();
      registerWargaDomain.value.name = name;
      registerWargaDomain.value.address_ktp = address;
      registerWargaDomain.value.address_domisili = addressSecond;
      registerWargaDomain.value.email = email;
      registerWargaDomain.value.phone = phone;

      // await repository.getLogin(
      //     editingControllers[0].text.toString()
      // );

      await Future.delayed(Duration(seconds: 5), () {
        registerState.value = ResponseSuccess(true);
      });
    }on FailureResponse catch(e) {
      await Future.delayed(Duration(seconds: 5), () {
        registerState.value = ResponseFailed(e);
      });
    }
  }
}
