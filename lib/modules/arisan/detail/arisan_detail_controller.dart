import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_page.dart';

class ArisanDetailController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(2, (index) => TextEditingController());
  final dataArisan = Get.arguments[ArisanDetailPage.argDataArisan] as Map<String, dynamic>;
  final stramController = StreamController<int>().obs;
  final bottomSheetData = {
    "isEnableButton"    : true,
    "valueDice"         : "",
    "arisan_id"         : "001",
  }.obs;
  final initLoading = true.obs;
  final showResult = false.obs;
  final initMessage = "".obs;
  final initLoadData = 0.obs;//0= total peserta, 1= list pemenang, 2= sisa peserta

  @override
  void onInit() {
    super.onInit();
    checkData();
  }
  @override
  void onClose() {
    super.onClose();
    stramController.value.close();
  }

  void checkData() {
    print("diceBool:${bottomSheetData.value["valueDice"].toString().isNotEmpty}");
    print("dices:${bottomSheetData.value["valueDice"].toString()}");
  }
}
