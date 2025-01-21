// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/core/data_state.dart';
import 'package:parawarga_apps/models/response/my_area_unit_model.dart';
import 'package:parawarga_apps/modules/my_area_unit/empty/my_unit_empty_page.dart';
import 'package:parawarga_apps/modules/my_area_unit/input/my_unit_input_page.dart';
import 'package:parawarga_apps/modules/my_area_unit/item/setting_unit_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_alert_dialog.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';
import 'package:parawarga_apps/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/app_pages.dart';
import '../../theme/app_theme.dart';
import '../../theme/standard_error_page.dart';
import '../../theme/standard_text_field.dart';
import 'item/my_area_tile.dart';
import 'my_area_controller.dart';

class MyAreaPage extends GetView<MyAreaController> {
  const MyAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(labelMyAreaUnit, style: TextStyle(color: colorPrimary)),
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
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: colorSecondary,
          onPressed: () {
            _buildContentBottomAddMyArea(context);
          },
          child: Icon(Iconsax.add, color: colorPrimary)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
    final list = controller.myAreaUnitState.value.data;
    if (controller.myAreaUnitState.value.isLoading) {
      return Container();
    }

    if (list == null || list.isEmpty == true ||
        controller.myAreaUnitState.value.error != null) {
      return StandardErrorPage(
        message: controller.myAreaUnitState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getMyUnit();
        },
      );
    }

    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          for (int i = 0; i < list.length; i++)
            Padding(
                padding: EdgeInsets.only(
                    top: (i == 0) ? basePaddingInContent : basePaddingInContent / 2,
                    left: basePaddingInContent,
                    right: basePaddingInContent,
                    bottom: (i == list.length - 1) ? basePaddingInContent : basePaddingInContent / 2),
                child: MyAreaTile(
                  model: list[i],
                  onPressedManagement: (model) async {
                    _buildContentBottomManagement(context, model);
                  },
                  onPressedMyUnit: (model) async {
                    _buildContentBottomMyUnit(context, model);
                  },
                ))
        ]));
  }

  _buildContentBottomManagement(BuildContext context, MyAreaUnitModel data) {
    return showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(baseRadius))),
        builder: (context) => FractionallySizedBox(
            heightFactor: 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: basePadding, left: basePadding, right: basePadding),
                  child: Text(labelAdminCitizen,
                    style: TextStyle(
                      color: colorTextTitle,
                      fontWeight: FontWeight.bold,
                      fontSize: 16))),
                Padding(
                    padding: EdgeInsets.only(left: basePadding, right: basePadding, bottom: basePaddingInContent),
                    child: Text("Berikut adalah data pengelola area yang berlaku pada ${data.startDate} s.d ${data.endDate}.",
                        style: TextStyle(
                            color: colorTextMessage,
                            fontSize: 12))),
                (data.detail.isNotEmpty)
                ? Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: basePaddingInContent, right: basePaddingInContent, bottom: basePaddingInContent),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(baseRadiusCard)),
                        color: colorBackground,
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.only(top: basePaddingInContent, bottom: basePaddingInContent),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: data.detail.length,
                            itemBuilder: (context, index) {
                              return ManagementTile(
                                model: data.detail[index],
                                isLast: index == data.detail.length - 1,
                              );
                            },
                          ),
                        )),
                  ),
                )
                : StandardErrorPage(message: msgNotFound)
            ])
        )
    );
  }

  _buildContentBottomMyUnit(BuildContext context, MyAreaUnitModel data) {
    return showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(baseRadius))),
        builder: (context) => FractionallySizedBox(
            heightFactor: 0.6,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                            padding: EdgeInsets.only(top: basePadding, left: basePadding),
                            child: Text("$labelUnit $labelMy",
                                style: TextStyle(
                                    color: colorTextTitle,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Padding(
                            padding: EdgeInsets.only(left: basePadding, bottom: basePaddingInContent),
                            child: Text("Berikut adalah unit yang Anda miliki di Area ${data.areaName}.",
                                style: TextStyle(
                                    color: colorTextMessage,
                                    fontSize: 12))),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: basePaddingInContent, left: basePaddingInContent, right: basePadding),
                      child: FloatingActionButton.small(
                          shape: CircleBorder(),
                          backgroundColor: colorSecondary,
                          elevation: 0,
                          onPressed: () async {
                            Get.back();
                            await Get.toNamed(Routes.myUnitInput, arguments: {
                              MyUnitInputPage.argAreaId: data.areaId
                            });
                            controller.getMyUnit();
                          },
                          child: Icon(Iconsax.add, color: colorPrimary)
                      ),
                    )
                  ]),
                  (data.unit.isNotEmpty)
                  ? Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: basePaddingInContent, right: basePaddingInContent, bottom: basePaddingInContent),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(baseRadiusCard)),
                          color: colorBackground,
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.only(top: basePaddingInContent, bottom: basePaddingInContent),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: data.unit.length,
                              itemBuilder: (context, index) {
                                return MyUnitTile(
                                  model: data.unit[index],
                                  isLast: index == data.unit.length - 1,
                                  onPressed: (model) {
                                    _buildContentDialogManageUnit(context, model, data);
                                  }
                                );
                              },
                            ),
                          )),
                    ),
                  )
                  : StandardErrorPage(message: msgNotFound)
                ])
        )
    );
  }

  _buildContentDialogManageUnit(BuildContext context, Unit data, MyAreaUnitModel area) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(baseRadius)),
        child: Padding(
          padding: const EdgeInsets.all(basePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(labelSettingUnit,
                  style: TextStyle(
                      color: colorTextTitle,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Text("Pilih salah satu pengaturan dibawah ini",
                  style: TextStyle(
                      color: colorTextMessage,
                      fontSize: 12)),
              SizedBox(height: basePaddingInContent),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return SettingUnitTile(
                    index: index,
                    isLast: index == (4 - 1),
                    onPressed: (model) async {
                      Get.back();
                      Get.back();
                      if (model == 0) {//ubah data
                        await Get.toNamed(Routes.myUnitInput, arguments: {
                          MyUnitInputPage.argAreaId: area.areaId,
                          MyUnitInputPage.argUnit: data
                        });
                        controller.getMyUnit();
                      } else if (model == 1) {//atur unit kosong
                        await Get.toNamed(Routes.myUnitEmpty, arguments: {
                          MyUnitEmptyPage.argUnitId: data.id,
                          MyUnitEmptyPage.argUnitName: data.name,
                        });
                        controller.getMyUnit();
                      } else if (model == 2) {//lihat lokasi
                        if(data.latitude != null && data.longitude != null) {
                          final googleUrl = "https://www.google.com/maps/search/?api=1&query=${data.latitude},${data.longitude}";
                          if (await canLaunchUrl(Uri.parse(googleUrl))) {
                            await launchUrl(Uri.parse(googleUrl));
                          } else {
                            throw "Map tidak ditemukan";
                          }
                        }else {
                          showStandardSnackbar(context, TypeMessage.error, message: "Lokasi belum diatur");
                        }
                      } else if (model == 3) {//hapus data
                        StandardAlertDialog.show(
                          context,
                          "Hapus Unit",
                          "Apakah Anda yakin menghapus unit ${data.name}?", () async {
                          await controller.removeMyUnit(data.id.toString()).whenComplete(() {
                            if (controller.saveOrRemoveState.value.error != null){
                              showStandardSnackbar(Get.context!, TypeMessage.error, message: controller.saveOrRemoveState.value.error?.message.toString());
                            }else {
                              showStandardSnackbar(Get.context!, TypeMessage.success, message: controller.saveOrRemoveState.value.data?.data.toString());
                              controller.getMyUnit();
                            }
                          });

                          controller.saveOrRemoveState.value = ResponseState.def();
                        });
                      }
                    });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildContentBottomAddMyArea(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(baseRadius))),
        builder: (context) => FractionallySizedBox(
            heightFactor: 0.6,
            child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: basePadding, left: basePadding),
                    child: Text("Menambahkan Area",
                      style: TextStyle(
                        color: colorTextTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))),
                  Padding(
                    padding: EdgeInsets.only(left: basePadding, bottom: basePaddingInContent),
                    child: Text("Tambahkan kode area yang Anda miliki agar area Anda bertambah.",
                      style: TextStyle(
                        color: colorTextMessage,
                        fontSize: 12))),
                  Form(
                    key: controller.formKey,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: StandardTextField(
                                editingController:
                                controller.editingControllers[0],
                                titleHint: labelKodeArea,
                                msgError: msgFieldEmpty,
                                inputAction: TextInputAction.done)),
                        Padding(padding: EdgeInsets.only(top: 20), child:
                        SizedBox(
                            height: 42,
                            child: RawMaterialButton(
                              onPressed: () async {
                                if (controller.formKey.currentState!.validate()) {
                                  if(controller.editingControllers[0].text.toString().isEmpty) {
                                    showStandardSnackbar(context, TypeMessage.error, message: msgFieldEmpty, paddingBottom: 60);
                                    return;
                                  }

                                  FocusScope.of(context).unfocus();
                                  await controller.checkArea();
                                }
                              },
                              shape: CircleBorder(),
                              elevation: 2,
                              fillColor: colorButtonPrimary,
                              child: Icon(Iconsax.search_normal_1,
                                  color: Colors.white),
                            )))
                      ],
                    ),
                  ),
                  Visibility(visible: (controller.checkAreaState.value.error != null) ? true : false, child: Padding(
                      padding: EdgeInsets.only(top: basePaddingInContent, left: basePadding, bottom: basePaddingInContent),
                      child: Text(controller.checkAreaState.value.error?.message ?? msgUnknown,
                          style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 12)))),
                  Visibility(
                      visible: (controller.checkAreaState.value.data != null) ? true : false,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: basePadding,
                              top: basePadding,
                              right: basePadding),
                          child: SizedBox(
                              width: Get.width,
                              child: Text.rich(TextSpan(
                                  text: "Area ditemukan :",
                                  style: TextStyle(color: colorTextSecondary),
                                  children: [
                                    TextSpan(
                                        text: controller.checkAreaState.value.data?.toString(),
                                        style: TextStyle(
                                            color: colorTextSecondary,
                                            fontWeight: FontWeight.bold))
                                  ]))))),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: basePadding, right: basePadding, top: basePadding),
                    child: StandardButtonPrimary(
                      titleHint: labelSubmit,
                      isEnabled: controller.checkAreaState.value.data != null,
                      isLoading: controller.saveOrRemoveState.value.isLoading,
                      onPressed: () async {
                        await controller.saveMyArea().whenComplete(() {
                          if (controller.saveOrRemoveState.value.data != null){
                            showStandardSnackbar(context, TypeMessage.success, message: controller.saveOrRemoveState.value.data?.data.toString());
                            Get.back();
                          }
                        });
                        },
                    ),
                  ),
                  Visibility(visible: (controller.saveOrRemoveState.value.error != null) ? true : false, child: Padding(
                    padding: EdgeInsets.only(top: basePaddingInContent, left: basePadding, bottom: basePaddingInContent),
                    child: Text(controller.saveOrRemoveState.value.error?.message ?? msgUnknown,
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 12)))),
                ]))
        )
    ).whenComplete(() async {
      controller.checkAreaState.value = ResponseState.def();
      controller.saveOrRemoveState.value = ResponseState.def();
      controller.editingControllers[0].text = "";
      await controller.getMyUnit();
    });
  }
}
