// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
    return Scaffold(body: Obx(() => _buildContentTop(context)));
  }

  _buildContentTop(BuildContext context) {
    return Container(
      color: colorBackground,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery
            .of(context)
            .viewPadding
            .top),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .viewPadding
                  .top * 2,
              child: Padding(
                padding: EdgeInsets.only(
                    left: basePadding, right: basePadding),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Iconsax.arrow_left, color: colorPrimary)),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: basePadding),
                        child: Text(
                          labelInfo,
                          style: TextStyle(
                              color: colorPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                  )
                ]),
              ),
            ),
            Expanded(
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
                      ))),
            )
          ],
        ),
      ),
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
        onPressed: () {
          controller.getInformationDetail();
        },
      );
    }

    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(basePadding),
          child: Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.infoState.value.data?.areaName.toString() ?? "",
                    style: TextStyle(
                        color: colorTextSecondary, fontSize: 12),
                  ),
                  Text(
                    controller.infoState.value.data?.updatedAt.toString() ?? "",
                    style: TextStyle(
                        color: colorTextSecondary, fontSize: 12),
                  )
                ]
            ),
            SizedBox(height: basePaddingInContent),
            Text(
              controller.infoState.value.data?.title.toString() ?? "",
              style: TextStyle(
                  color: colorTextPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(height: basePaddingInContent),
            Text(
              controller.infoState.value.data?.message.toString() ?? "",
              style: TextStyle(
                  color: colorTextSecondary, fontSize: 12),
            ),
          ]),
        ));
  }
}
