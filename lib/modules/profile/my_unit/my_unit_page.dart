// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/data_state.dart';
import 'package:parawarga_apps/models/response/my_area_unit_model.dart';
import 'package:parawarga_apps/modules/my_area_unit/item/setting_unit_tile.dart';
import 'package:parawarga_apps/modules/profile/my_unit/my_unit_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_alert_dialog.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';
import 'package:parawarga_apps/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/standard_error_page.dart';
import 'empty/my_unit_empty_page.dart';
import 'input/my_unit_input_page.dart';
import 'item/my_unit_tile.dart';

class MyUnitPage extends GetView<MyUnitController> {
  const MyUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(labelMyUnit, style: TextStyle(color: colorPrimary)),
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
                  onCreate: (area) async {
                    await Get.toNamed(Routes.myUnitInput, arguments: {
                      MyUnitInputPage.argAreaId: area.areaId,
                    });
                    controller.getMyUnit();
                  },
                  onPressed: (unit, area) async {
                    _buildContentDialogManageUnit(context, unit, area);
                  },
                ))
        ]));
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
                            showStandardSnackbar(Get.context!, TypeMessage.error, message: "Map tidak ditemukan");
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
}
