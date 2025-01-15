// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/modules/unit_empty/item/unit_empty_tile.dart';
import 'package:parawarga_apps/modules/unit_empty/unit_empty_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../theme/app_theme.dart';
import '../../theme/standard_error_page.dart';

class UnitEmptyPage extends GetView<UnitEmptyController> {
  const UnitEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(labelUnitEmpty, style: TextStyle(color: colorPrimary)),
        centerTitle: true,
        backgroundColor: colorBackground,
        surfaceTintColor: colorBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorPrimary),
          onPressed: () { Get.back(); },
        ),
      ),
      body: Obx (() => _buildContentBackground(context)),
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
    final list = controller.emptyUnitState.value.data;
    if (controller.emptyUnitState.value.isLoading) {
      return Container();
    }

    if (list == null || list.isEmpty == true ||
        controller.emptyUnitState.value.error != null) {
      return StandardErrorPage(
        message: controller.emptyUnitState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getEmptyUnit();
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
            child: UnitEmptyTile(
              model: list[i],
              onPressed: (model) async {
              },
            ))
      ]));
  }
}
