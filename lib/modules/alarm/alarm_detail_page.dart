// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/alarm/alarm_detail_controller.dart';
import 'package:parawarga_apps/theme/standard_error_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_zoom/widget_zoom.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/strings.dart';
import '../../theme/standard_snackbar.dart';
import 'item/alarm_status_tile.dart';

class AlarmDetailPage extends GetView<AlarmDetailController> {
  const AlarmDetailPage({super.key});

  static const argId = 'argId';

  @override
  Widget build(BuildContext context) {
    controller.getAlarmDetail();
    return Scaffold(
      appBar: AppBar(
        title: Text(labelAlarmDetail, style: TextStyle(color: colorPrimary)),
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
    final data = controller.alarmState.value.data;
    if (controller.alarmState.value.isLoading) {
      return Container();
    }

    if (data == null || controller.alarmState.value.error != null) {
      return StandardErrorPage(
        message: controller.alarmState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getAlarmDetail();
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
                        data.areaName ?? "",
                        style: TextStyle(
                            color: colorTextMessage, fontSize: 12),
                      ),
                      Text(
                        data.updatedAt ?? "",
                        style: TextStyle(
                            color: colorTextlabel, fontSize: 12),
                      )
                    ]
                ),
                SizedBox(height: basePadding),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: CircleAvatar(
                          child: ClipOval(
                            child: (data.photo != null)
                                ? WidgetZoom(
                                heroAnimationTag: "Zoom",
                                zoomWidget: Image.network(data.photo.toString(), width: 30, height: 30, fit: BoxFit.cover)
                            )
                                : Icon(Iconsax.user, color: colorTextTitle, size: 30),
                          ),
                        ),
                      ),
                      SizedBox(width: basePaddingInContent),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.createdName.toString(),
                              style: TextStyle(
                                  color: colorTextTitle, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () async {
                                if(data.latitude != null && data.longitude != null) {
                                  final googleUrl = "https://www.google.com/maps/search/?api=1&query=${data.latitude},${data.longitude}";
                                  if (await canLaunchUrl(Uri.parse(googleUrl))) {
                                    await launchUrl(Uri.parse(googleUrl));
                                  } else {
                                    showStandardSnackbar(Get.context!, TypeMessage.error, message: "Map tidak ditemukan");
                                  }
                                }else {
                                  showStandardSnackbar(context, TypeMessage.error, message: "Lokasi tidak ditemukan");
                                }
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Iconsax.location, color: colorTextMessage, size: 12),
                                  SizedBox(width: basePaddingInContent / 2),
                                  Expanded(
                                    child: Text(
                                      data.generateLocation.toString(),
                                      style: TextStyle(
                                          color: colorTextMessage, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ]
                ),
                SizedBox(height: basePaddingInContent),
                Row(children: [
                  Expanded(
                    child: Text(
                      labelMessage,
                      style: TextStyle(
                          color: colorTextMessage, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ":",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorTextMessage, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        data.message.toString(),
                        style: TextStyle(
                            color: colorTextTitle,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ]),
                SizedBox(height: basePadding),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(baseRadiusCard),
                        color: Colors.white
                    ),
                    child: Column(children: [
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(baseRadiusCard),
                                topRight: Radius.circular(baseRadiusCard)),
                            color: colorPrimary
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(basePaddingInContent),
                          child: Text(
                            labelStatusAlarm,
                            style: TextStyle(
                                color: colorLight,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(height: basePaddingInContent),
                      for (int i = 0; i < data.history.length; i++)
                        Padding(
                          padding: EdgeInsets.only(
                              top: (i == 0) ? basePaddingInContent : 0,
                              left: basePaddingInContent,
                              right: basePaddingInContent,
                              bottom: (i == data.history.length - 1)
                                  ? basePaddingInContent
                                  : 0),
                          child: AlarmStatusTile(
                            model: data.history[i],
                            isFirst: i == 0,
                            isLast: i == (data.history.length - 1),
                            onPressed: (model) async {},
                          ),
                        )
                    ])
                )
              ]),
        ));
  }
}
