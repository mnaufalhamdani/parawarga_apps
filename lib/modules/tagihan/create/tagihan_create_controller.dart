// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:parawarga_apps/models/domain/tagihan_domain.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/models/response/tagihan_detail_model.dart';
import 'package:parawarga_apps/modules/tagihan/create/tagihan_create_page.dart';

import '../../../core/data_state.dart';
import '../../../core/failure_response.dart';
import '../../../data/repository/tagihan_repository.dart';

class TagihanCreateController extends GetxController{
  TagihanCreateController({
    required this.repository,
  });

  final model = Get.arguments[TagihanCreatePage.argTagihan] as TagihanDetailModel;
  final TagihanRepository repository;

  final tagihanTempDomain = Rx(TagihanTempDomain());//save tagihan temp
  final tagihanPeriode = Rx<int>(0);//index history -> user

  final tagihanTempState = Rx(ResponseState<GeneralModel>());

  Future<void> saveTagihanTemp() async {
    try {
      if(tagihanPeriode.value == 0 || tagihanTempDomain.value.account_bank_id == null) {
        throw FailureResponse(message: "Periode atau rekening masih kosong");
      }

      tagihanTempState.value = ResponseState.loading();

      tagihanTempDomain.value.tagihan_id = model.id;
      tagihanTempDomain.value.total_periode = tagihanPeriode.value;

      final totalNominal = int.parse(model.nominal ?? "0") * tagihanPeriode.value;
      tagihanTempDomain.value.total_nominal = totalNominal;

      final response = await repository.saveTagihanTemp(tagihanTempDomain.value);
      tagihanTempState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      tagihanTempState.value = ResponseState.failed(e);
    }
  }
}
