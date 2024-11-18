import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_page.dart';

class ArisanDetailController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(2, (index) => TextEditingController());
  final dataArisan = Get.arguments[ArisanDetailPage.argDataArisan] as Map<String, dynamic>;
  final initLoading = false.obs;
  final initMessage = "".obs;
  final initLoadData = 0.obs;//0= total peserta, 1= list pemenang, 2= sisa peserta
}
