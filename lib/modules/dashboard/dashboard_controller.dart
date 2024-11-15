import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';

class DashboardController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(2, (index) => TextEditingController());
  final initLoading = false.obs;
  final initMessage = "".obs;
  final initVoting = 4.obs;
  final listData = listExample.obs;
}
