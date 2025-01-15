// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/my_area_unit_model.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../theme/app_theme.dart';
import '../../theme/standard_error_page.dart';
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
                    if (model.detail.isEmpty){
                      showStandardSnackbar(context, TypeMessage.error, message: msgNotFound);
                    }else {
                      _buildContentBottomManagement(context, model);
                    }
                  },
                  onPressedMyUnit: (model) async {
                    if (model.unit.isEmpty){
                      showStandardSnackbar(context, TypeMessage.error, message: msgNotFound);
                    }else {
                      _buildContentBottomMyUnit(context, model);
                    }
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
                  padding: EdgeInsets.all(basePadding),
                  child: Text("$labelTotal $labelAdmin",
                    style: TextStyle(
                      color: colorTextTitle,
                      fontWeight: FontWeight.bold,
                      fontSize: 16))),
                Padding(
                    padding: EdgeInsets.only(left: basePadding, right: basePadding),
                    child: Text("Berikut adalah list Manajemen Area yang berlaku pada ${data.startDate} s.d ${data.endDate}.",
                        style: TextStyle(
                            color: colorTextTitle,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))),
                Expanded(child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: data.detail.length,
                  itemBuilder: (context, index) {
                    return ManagementTile(
                      model: data.detail[index],
                    );
                  },
                ))
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
                Padding(
                    padding: EdgeInsets.all(basePadding),
                    child: Text("$labelTotal $labelAdmin",
                        style: TextStyle(
                            color: colorTextTitle,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))),
                Padding(
                    padding: EdgeInsets.only(left: basePadding, right: basePadding),
                    child: Text("Berikut adalah unit yang Anda miliki di Area ${data.areaName}.",
                        style: TextStyle(
                            color: colorTextTitle,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))),
                Expanded(child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: data.unit.length,
                  itemBuilder: (context, index) {
                    return MyUnitTile(
                      model: data.unit[index],
                    );
                  },
                ))
              ])
      )
    );
  }
}
