// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/issue/detail/issue_detail_controller.dart';
import 'package:parawarga_apps/modules/issue/item/issue_status_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';

class IssueDetailPage extends GetView<IssueDetailController> {
  const IssueDetailPage({super.key});

  static const argId = 'argId';

  @override
  Widget build(BuildContext context) {
    controller.getIssueDetail();
    return Scaffold(
      body: Obx(() => _buildContentTop(context)),
    );
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
                          labelLaporan,
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
    final data = controller.issueState.value.data;
    if (controller.issueState.value.isLoading) {
      return Container();
    }

    if (data == null || controller.issueState.value.error != null) {
      return _buildError();
    }

    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(basePadding),
          child: Column(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(baseRadiusForm),
                child: Image.network(height: 200,
                    data.attachment.first.attachment.toString(),
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Icon(
                          Iconsax.gallery_slash, color: colorTextSecondary);
                    })
            ),
            SizedBox(height: basePaddingInContent),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.areaName.toString(),
                    style: TextStyle(
                        color: colorTextSecondary, fontSize: 12),
                  ),
                  Text(
                    data.updatedAt.toString(),
                    style: TextStyle(
                        color: colorTextSecondary, fontSize: 12),
                  )
                ]
            ),
            SizedBox(height: basePaddingInContent),
            Text(
              data.title.toString(),
              style: TextStyle(
                  color: colorTextPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(height: basePaddingInContent),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Iconsax.map_1, color: colorTextSecondary),
                  SizedBox(width: basePaddingInContent),
                  Text(
                    data.additionalLocation ?? data.generateLocation.toString(),
                    style: TextStyle(
                        color: colorTextSecondary, fontSize: 12),
                  )
                ]
            ),
            SizedBox(height: basePaddingInContent),
            Text(
              data.message.toString(),
              style: TextStyle(
                  color: colorTextSecondary, fontSize: 12),
            ),
            SizedBox(height: basePaddingInContent),
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
                        "Status Laporan",
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
                          top: (i == 0) ? basePadding : baseRadiusForm,
                          left: basePadding,
                          right: basePadding,
                          bottom: (i == data.history.length - 1)
                              ? basePadding
                              : baseRadiusForm),
                      child: IssueStatusTile(
                        model: data.history[i],
                        onPressed: (model) async {},
                      ),
                    )
                ])
            )
          ]),
        ));
  }

  _buildError() {
    return Padding(padding: EdgeInsets.only(top: 100), child: Center(
        child: GestureDetector(
            onTap: () {
              controller.getIssueDetail();
            },
            child: SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 200,
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/images/background/gif_no_data.gif")),
                Text(
                  controller.issueState.value.error?.message.toString() ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87),
                )
              ],
            ))
        ))
    );
  }
}
