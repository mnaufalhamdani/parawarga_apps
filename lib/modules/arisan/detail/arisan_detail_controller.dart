// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:get/get.dart';
import 'package:parawarga_apps/models/domain/arisan_domain.dart';
import 'package:parawarga_apps/models/response/ArisanDetailModel.dart';
import 'package:parawarga_apps/models/response/general_model.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_page.dart';

import '../../../core/data_state.dart';
import '../../../core/failure_response.dart';
import '../../../data/repository/arisan_repository.dart';
import '../../../utils/strings.dart';

class ArisanDetailController extends GetxController{
  ArisanDetailController({
    required this.repository,
  });

  final id = Get.arguments[ArisanDetailPage.argId] as String;
  final ArisanRepository repository;

  final arisanWinnerDomain = Rx(ArisanWinnerDomain());//save arisan win
  final arisanWinnerState = Rx(ResponseState<GeneralModel>());

  final arisanState = Rx(ResponseState<ArisanDetailModel>());
  final arisanLabel = Rx("");
  final arisanClicked = Rxn<int>(0);//null = history, 0 = pemenang, 1 = sisa peserta
  final arisanHistory = Rx<int>(0);//index history -> user

  Future<void> getArisanDetail() async {
    try {
      arisanState.value = ResponseState.loading();

      final response = await repository.getArisanDetail(id);

      arisanLabel.value = labelTotalOfWin;
      arisanClicked.value = 0;
      arisanState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      arisanState.value = ResponseState.failed(e);
    }
  }

  Future<void> saveArisanWinner() async {
    try {
      arisanWinnerState.value = ResponseState.loading();

      Future.delayed(Duration(seconds: 5), () async {
        final response = await repository.saveArisanWinner(arisanWinnerDomain.value);

        arisanWinnerState.value = ResponseState.success(response);
      });
    }on FailureResponse catch(e) {
      arisanWinnerState.value = ResponseState.failed(e);
    }
  }

  // final formKey = GlobalKey<FormState>();
  // final dataArisan = Get.arguments[ArisanDetailPage.argDataArisan] as Map<String, dynamic>;
  // final stramController = StreamController<int>().obs;
  // final bottomSheetData = {
  //   "isEnableButton"    : true,
  //   "valueDice"         : "",
  //   "arisan_id"         : "001",
  // }.obs;
  // final initLoading = true.obs;
  // final showResult = false.obs;
  // final initMessage = "".obs;
  // final initLoadData = 0.obs;//0= total peserta, 1= list pemenang, 2= sisa peserta

  @override
  void onInit() {
    super.onInit();
    checkData();
  }
  @override
  void onClose() {
    super.onClose();
    // stramController.value.close();
  }

  void checkData() {
    // print("diceBool:${bottomSheetData.value["valueDice"].toString().isNotEmpty}");
    // print("dices:${bottomSheetData.value["valueDice"].toString()}");
  }
}
