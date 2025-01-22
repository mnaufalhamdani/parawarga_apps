// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/data/repository/issue_repository.dart';
import 'package:parawarga_apps/models/domain/issue_domain.dart';
import 'package:parawarga_apps/models/domain/user_area_domain.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../core/data_state.dart';
import '../../../core/failure_response.dart';
import '../../../models/response/general_model.dart';

class IssueInputController extends GetxController{
  IssueInputController({
    required this.repository,
  });

  final IssueRepository repository;

  @override
  void onInit() {
    super.onInit();
    getUserArea();
  }

  final formKey = GlobalKey<FormState>();
  //area_id, topic, desc, location,
  final editingControllers = List.generate(4, (index) => TextEditingController());
  final inputIssueDomain = Rx(InputIssueDomain(attachments: []));
  final inputAttachmentDomain = RxList<InputIssueAttachmentDomain>.empty(growable: true);

  void addAttachment(String value) {
    inputAttachmentDomain.add(InputIssueAttachmentDomain(attachment: value));
  }

  void updateAttachment(int index, String newValue) {
    inputAttachmentDomain[index] = InputIssueAttachmentDomain(attachment: newValue);
    inputAttachmentDomain.refresh();
  }

  void removeAttachment(int index) {
    inputAttachmentDomain.removeAt(index);
  }

  final userAreaState = Rx(ResponseState<UserAreaDomain>());

  Future<void> getUserArea() async {
    try {
      userAreaState.value = ResponseState.loading();

      final response = await repository.getUserActive();
      if(response.areaEntity?.length == 1) {
        inputIssueDomain.value.area_id = response.areaEntity?.first.area_id.toString();
        return;
      }else {
        userAreaState.value = ResponseState.success(response);
      }
    }on FailureResponse catch(e) {
      userAreaState.value = ResponseState.failed(e);
    }
  }

  final saveState = Rx(ResponseState<GeneralModel>());

  Future<void> saveIssue() async {
    try {
      if (inputAttachmentDomain.isEmpty) {
        throw FailureResponse(message: "Minimal 1 file untuk laporan Anda");
      }
      saveState.value = ResponseState.loading();

      final position = await getLocation();
      if(position == null) {
        throw FailureResponse(message: msgUnknown);
      }

      final address = await getAddressLocation(position.latitude, position.longitude);
      inputIssueDomain.value.title = editingControllers[1].text.toString();
      inputIssueDomain.value.message = editingControllers[2].text.toString();
      inputIssueDomain.value.additional_location = editingControllers[3].text.toString();
      inputIssueDomain.value.latitude = position.latitude.toString();
      inputIssueDomain.value.longitude = position.longitude.toString();
      inputIssueDomain.value.generate_location = address;
      for (var element in inputAttachmentDomain){
        final photoFile = File(element.attachment.toString());
        final imageBytes = await photoFile.readAsBytes();
        inputIssueDomain.value.attachments.add(InputIssueAttachmentDomain(
            attachment: "data:${lookupMimeType(element.attachment.toString())};base64,${base64Encode(imageBytes)}"
        ));
      }
      final response = await repository.saveIssue(inputIssueDomain.value);

      saveState.value = ResponseState.success(response);
    }on FailureResponse catch(e) {
      saveState.value = ResponseState.failed(e);
    }
  }
}
