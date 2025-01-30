// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/theme/standard_text_field.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../../theme/app_theme.dart';
import '../../../../theme/standard_snackbar.dart';
import 'my_unit_empty_controller.dart';

class MyUnitEmptyPage extends GetView<MyUnitEmptyController> {
  const MyUnitEmptyPage({super.key});

  static const argUnitId = 'argUnitId';
  static const argUnitName = 'argUnitName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children: [
          Text(labelUnitEmpty, style: TextStyle(color: colorPrimary)),
          Text(controller.unitName, style: TextStyle(color: colorTextMessage, fontSize: 12))
        ]),
        centerTitle: true,
        backgroundColor: colorBackground,
        surfaceTintColor: colorBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorPrimary),
          onPressed: () { Get.back(); },
        ),
      ),
      body: Obx(() => _buildContentBackground(context)),
    );
  }

  _buildContentBackground(BuildContext context) {
    return Container(
      color: colorBackground,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(baseRadiusCard),
              topRight: Radius.circular(baseRadiusCard),
            ),
            color: colorPrimary),
        child: Padding(
            padding: EdgeInsets.only(top: baseRadiusCard),
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(baseRadiusCard),
                  topRight: Radius.circular(baseRadiusCard),
                ),
                color: colorBackground,
              ),
              child: _buildContentMainMenu(context),
            )))
    );
  }

  _buildContentMainMenu(BuildContext context) {
    final data = controller.myUnitEmptyState.value.data;
    if (controller.myUnitEmptyState.value.isLoading) {
      return Container();
    }

    if (data == null) {//create
      return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              StandardTextField(
                editingController: controller.editingControllers[0],
                titleHint: "$labelDate $labelStart",
                msgError: msgFieldEmpty,
                readOnly: true,
                inputAction: TextInputAction.next,
                onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1)
                    ).then((onValue) {
                      if (onValue != null){
                        controller.editingControllers[0].text = DateFormat("dd MMM yyyy").format(onValue).toString();
                        controller.myUnitEmptyDomain.value.start_date = DateFormat("yyyy-MM-dd").format(onValue).toString();
                      }
                    });
                }),
              StandardTextField(
                editingController: controller.editingControllers[1],
                titleHint: "$labelDate $labelEnd",
                readOnly: true,
                inputAction: TextInputAction.next,
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                  ).then((onValue) {
                    if (onValue != null){
                      controller.editingControllers[1].text = DateFormat("dd MMM yyyy").format(onValue).toString();
                      controller.myUnitEmptyDomain.value.end_date = DateFormat("yyyy-MM-dd").format(onValue).toString();
                    }
                  });
                }),
              Padding(
                padding: EdgeInsets.only(left: basePadding, right: basePadding),
                child: Text("Tanggal Akhir bersifat (optional), boleh tidak di isi.",
                    style: TextStyle(
                      color: colorTextMessage,
                      fontSize: 12,
                      fontStyle: FontStyle.italic
                    )),
              ),
              StandardTextField(
                  editingController: controller.editingControllers[2],
                  titleHint: labelMessage,
                  inputAction: TextInputAction.done),
              Container(
                width: Get.width,
                margin: EdgeInsets.only(left: basePadding, right: basePadding, top: basePadding),
                child: StandardButtonPrimary(
                  formKey: controller.formKey,
                  titleHint: labelSubmit,
                  isLoading: controller.saveState.value.isLoading,
                  onPressed: () async {
                    await controller.saveManageEmptyUnit().whenComplete(() {
                      if (controller.saveState.value.error != null){
                        showStandardSnackbar(context, TypeMessage.error, message: controller.saveState.value.error?.message.toString());
                      }else {
                        showStandardSnackbar(context, TypeMessage.success, message: controller.saveState.value.data?.data.toString());
                        Get.back();
                      }
                    });
                  },
                ),
              )
            ]),
          ));
    }else {//update
      return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            StandardTextField(
              editingController: controller.editingControllers[0],
              titleHint: "$labelDate $labelStart",
              isEnabled: false,
              inputAction: TextInputAction.next,
            ),
            StandardTextField(
              editingController: controller.editingControllers[1],
              titleHint: "$labelDate $labelEnd",
              isEnabled: false,
              inputAction: TextInputAction.next,
            ),
            Padding(
              padding: EdgeInsets.only(left: basePadding, right: basePadding),
              child: Text("Tanggal Akhir bersifat (optional), boleh tidak di isi.",
                  style: TextStyle(
                      color: colorTextMessage,
                      fontSize: 12)),
            ),
            StandardTextField(
                editingController: controller.editingControllers[2],
                titleHint: labelMessage,
                isEnabled: false,
                inputAction: TextInputAction.done),
            Container(
              width: Get.width,
              margin: EdgeInsets.only(left: basePadding, right: basePadding, top: basePadding),
              child: StandardButtonPrimary(
                titleHint: labelBackNow,
                color: Colors.white,
                buttonColor: Colors.red.shade700,
                isLoading: controller.saveState.value.isLoading,
                onPressed: () async {
                  await controller.saveManageEmptyUnit().whenComplete(() {
                    if (controller.saveState.value.error != null){
                      showStandardSnackbar(context, TypeMessage.error, message: controller.saveState.value.error?.message.toString());
                    }else {
                      showStandardSnackbar(context, TypeMessage.success, message: controller.saveState.value.data?.data.toString());
                      Get.back();
                    }
                  });
                },
              ),
            )
          ]));
    }
  }
}
