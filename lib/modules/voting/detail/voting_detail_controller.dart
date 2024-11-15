import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/utils/strings.dart';

class VotingDetailController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final editingControllers = List.generate(2, (index) => TextEditingController());
  final initLoading = false.obs;
  final initMounted = false.obs;
  final initMessage = "".obs;
  final initLabelOfVoters = labelTotalMember.obs;
  final listData = listVotingDetail.obs;
  final scrollController = ScrollController().obs;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if(initMounted.value == false){
        initMounted.value = true;
        scrollController.value.jumpTo(scrollController.value.position.minScrollExtent);
      }else {
        timer.cancel();
      }
    });
  }
}
