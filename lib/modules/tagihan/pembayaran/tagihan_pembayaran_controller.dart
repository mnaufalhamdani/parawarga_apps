// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:parawarga_apps/models/domain/tagihan_domain.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/modules/tagihan/pembayaran/tagihan_pembayaran_page.dart';

import '../../../core/data_state.dart';
import '../../../core/failure_response.dart';
import '../../../data/repository/tagihan_repository.dart';
import '../../../models/response/tagihan_temp_model.dart';

class TagihanPembayaranController extends GetxController{
  TagihanPembayaranController({
    required this.repository,
  });

  final id = Get.arguments[TagihanPembayaranPage.argId] as String;// tagihan_temp_id
  final TagihanRepository repository;

  final tagihanPembayaranDomain = Rx(TagihanPembayaranDomain());//save tagihan temp
  final tagihanReceipt = Rxn<String>();

  final tagihanTempState = Rx(ResponseState<TagihanTempModel>());
  final tagihanPembayaranState = Rx(ResponseState<GeneralModel>());

  Future<void> getTagihanTemp() async {
    try {
      tagihanTempState.value = ResponseState.loading();

      final response = await repository.getTagihanTemp(id);

      tagihanTempState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      tagihanTempState.value = ResponseState.failed(e);
    }
  }

  Future<void> saveTagihanPembayaran() async {
    try {
      if(tagihanReceipt.value == null) {
        throw FailureResponse(message: "Lampiran masih kosong");
      }

      tagihanPembayaranState.value = ResponseState.loading();

      tagihanPembayaranDomain.value.tagihan_temp_id = tagihanTempState.value.data?.tagihanTempId;
      if(tagihanReceipt.value != null) {
        final photoFile = File(tagihanReceipt.value.toString());
        final imageBytes = await photoFile.readAsBytes();
        tagihanPembayaranDomain.value.receipt = "data:${lookupMimeType(tagihanReceipt.value.toString())};base64,${base64Encode(imageBytes)}";
      }

      final response = await repository.saveTagihanPembayaran(tagihanPembayaranDomain.value);
      tagihanPembayaranState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      tagihanPembayaranState.value = ResponseState.failed(e);
    }
  }
}
