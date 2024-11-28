import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';

class LaporanInputController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(10, (index) => TextEditingController());
  final initLoading = false.obs;
  final initMessage = "".obs;
  final listData = listExample.obs;
}
