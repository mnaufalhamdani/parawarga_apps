// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/issue/input/issue_input_controller.dart';
import 'package:parawarga_apps/modules/issue/item/issue_input_file_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/theme/standard_text_field.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/single_select/single_select_dialog.dart';
import '../../../theme/single_select/single_select_domain.dart';
import '../../../theme/standard_alert_dialog.dart';
import '../../../theme/standard_picker_dialog.dart';
import '../../../theme/standard_snackbar.dart';

class IssueInputPage extends GetView<IssueInputController> {
  const IssueInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(labelIssueInput, style: TextStyle(color: colorPrimary)),
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
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: controller.formKey,
          child: Column(children: [
            ((controller.userAreaState.value.data?.areaEntity?.length ?? 0) > 1)
            ? StandardTextField(
              editingController: controller.editingControllers[0],
              titleHint: labelArea,
              msgError: msgFieldEmpty,
              readOnly: true,
              inputAction: TextInputAction.next,
              onPressed: () {
                final listArea = controller.userAreaState.value.data!.areaEntity!;
                final listItem = List<SingleSelectDomain>.empty(growable: true);
                for (var i = 0; i < listArea.length; i++) {
                  listItem.add(SingleSelectDomain(
                      codeOrId: listArea[i].area_id.toString(),
                      message: listArea[i].area_name
                  ));
                }

                if (listItem.isEmpty) {
                  showStandardSnackbar(context, TypeMessage.error, message: msgNotFound);
                }else {
                  SingleSelectDialog.show(context, "Pilih Salah Satu Area", listItem, (idIndex, model) {
                    controller.inputIssueDomain.value.area_id = model.codeOrId;
                    controller.editingControllers[0].text = model.message.toString();
                  });
                }
              },
            )
            : Container(),
            StandardTextField(
                editingController: controller.editingControllers[1],
                titleHint: labelTopic,
                msgError: msgFieldEmpty,
                inputAction: TextInputAction.next),
            StandardTextField(
                editingController: controller.editingControllers[2],
                titleHint: labelDesc,
                msgError: msgFieldEmpty,
                inputAction: TextInputAction.next),
            StandardTextField(
                editingController: controller.editingControllers[3],
                titleHint: labelLocation,
                msgError: msgFieldEmpty,
                inputAction: TextInputAction.done),
            Padding(
              padding: EdgeInsets.only(left: basePadding, right: basePadding, top: basePadding),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(
                      padding: EdgeInsets.only(top: basePadding),
                      child: Text(labelAddAttachment,
                        style: TextStyle(
                          color: colorTextTitle,
                          fontWeight: FontWeight.bold,
                          fontSize: 16))),
                    Padding(
                      padding: EdgeInsets.only(bottom: basePaddingInContent),
                      child: Text("Tambahkan minimal 1 file untuk laporan Anda",
                        style: TextStyle(
                          color: colorTextMessage,
                          fontSize: 12))),
                  ]),
                ),
                FloatingActionButton.small(
                  shape: CircleBorder(),
                  backgroundColor: colorSecondary,
                  onPressed: () {
                    if(controller.inputAttachmentDomain.length == 3){
                      showStandardSnackbar(context, TypeMessage.warning, message: "Maksimal 3 file");
                      return;
                    }
                    StandardPickerDialog.show(context, (path) {
                      controller.addAttachment(path);
                    });
                  },
                  child: Icon(Iconsax.add, color: colorTextSecondary)
                ),
              ]),
            ),
            (controller.inputAttachmentDomain.isNotEmpty)
            ? ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: controller.inputAttachmentDomain.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: (index == 0) ? basePaddingInContent : basePaddingInContent / 2,
                    left: basePaddingInContent,
                    right: basePaddingInContent,
                    bottom: (index == controller.inputAttachmentDomain.length - 1)
                      ? basePaddingInContent
                      : basePaddingInContent / 2),
                  child: IssueInputFileTile(
                    model: controller.inputAttachmentDomain[index],
                    index: index,
                    onPressed: (model, i) {
                      StandardPickerDialog.show(context, (path) {
                        controller.updateAttachment(i, path);
                      });
                    },
                    onRemove: (model, i) {
                      controller.removeAttachment(i);
                    }
                  )
                );
              },
            )
            : Container(),
            Container(
              width: Get.width,
              margin: EdgeInsets.all(basePadding),
              child: StandardButtonPrimary(
                formKey: controller.formKey,
                titleHint: labelSubmit,
                isLoading: controller.saveState.value.isLoading,
                onPressed: () async {
                  StandardAlertDialog.show(
                    context,
                    "Laporan",
                    "Apakah Anda yakin melaporkan keluhan Anda?", () async {
                      await controller.saveIssue().whenComplete(() {
                        if (controller.saveState.value.error != null){
                          showStandardSnackbar(context, TypeMessage.error, message: controller.saveState.value.error?.message.toString());
                        }else {
                          showStandardSnackbar(context, TypeMessage.success, message: controller.saveState.value.data?.data.toString());
                          Get.back();
                        }
                      });
                  });
              })
            )
          ]),
        ));
  }
}
