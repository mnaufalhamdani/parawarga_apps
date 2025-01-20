// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/modules/info/detail/info_detail_controller.dart';
import 'package:parawarga_apps/theme/standard_error_page.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/strings.dart';

class InfoDetailPage extends GetView<InfoDetailController> {
  const InfoDetailPage({super.key});

  static const argId = 'argId';

  @override
  Widget build(BuildContext context) {
    controller.getInformationDetail();
    return Scaffold(
      appBar: AppBar(
        title: Text(labelInfoDetail, style: TextStyle(color: colorPrimary)),
        centerTitle: true,
        backgroundColor: colorBackground,
        surfaceTintColor: colorBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorPrimary),
          onPressed: () { Get.back(); },
        ),
      ),
      body: Obx(() => _buildContentBackground(context))
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
    final data = controller.infoState.value.data;
    if (controller.infoState.value.isLoading) {
      return Container();
    }

    if (data == null || controller.infoState.value.error != null) {
      return StandardErrorPage(
        message: controller.infoState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getInformationDetail();
        },
      );
    }

    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(basePaddingInContent),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.areaName.toString(),
                    style: TextStyle(
                        color: colorTextMessage, fontSize: 12),
                  ),
                  Text(
                    data.updatedAt.toString(),
                    style: TextStyle(
                        color: colorTextlabel, fontSize: 12),
                  )
                ]
            ),
            SizedBox(height: basePadding),
                Text(
                  data.title.toString(),
                  style: TextStyle(
                      color: colorTextTitle,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
            SizedBox(height: basePaddingInContent),
            Text(
              data.message ?? "-",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: colorTextMessage, fontSize: 12),
            ),
          ]),
        ));
  }
}
