// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/issue/detail/issue_detail_controller.dart';
import 'package:parawarga_apps/modules/issue/item/issue_status_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/standard_error_page.dart';

class IssueDetailPage extends GetView<IssueDetailController> {
  const IssueDetailPage({super.key});

  static const argId = 'argId';

  @override
  Widget build(BuildContext context) {
    controller.getIssueDetail();
    return Scaffold(
      appBar: AppBar(
        title: Text(labelIssueDetail, style: TextStyle(color: colorPrimary)),
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
      child: Expanded(
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
      ),
    );
  }

  _buildContentMainMenu(BuildContext context) {
    final data = controller.issueState.value.data;
    if (controller.issueState.value.isLoading) {
      return Container();
    }

    if (data == null || controller.issueState.value.error != null) {
      return StandardErrorPage(
        message: controller.issueState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getIssueDetail();
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
                  Icon(Iconsax.user, color: colorTextTitle, size: 30),
                  SizedBox(width: basePaddingInContent),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.createdName.toString(),
                        style: TextStyle(
                            color: colorTextTitle, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data.additionalLocation ?? data.generateLocation.toString(),
                        style: TextStyle(
                            color: colorTextMessage, fontSize: 12),
                      )
                    ],
                  )
                ]
            ),
            SizedBox(height: basePaddingInContent),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: data.attachment.length,
                onPageChanged: (index) {
                  controller.pageIndex.value = index;
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(basePaddingInContent),
                      child: Image.network(
                          data.attachment[index].attachment.toString(),
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Icon(
                                Iconsax.gallery_slash, color: colorTextTitle);
                          })
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(data.attachment.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: baseRadiusCard / 5, vertical: baseRadiusCard),
                  width: controller.pageIndex.value == index ? baseRadiusCard : baseRadiusCard,
                  height: baseRadiusCard,
                  decoration: BoxDecoration(
                    color: controller.pageIndex.value == index ? colorPrimary : colorTextMessage,
                    shape: BoxShape.circle,
                  ),
                );
              })),
            SizedBox(height: basePaddingInContent),
            Text(
              data.title.toString(),
              style: TextStyle(
                  color: colorTextTitle,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(height: basePaddingInContent),
            Text(
              data.message.toString(),
              style: TextStyle(
                  color: colorTextMessage, fontSize: 14),
            ),
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
                        labelStatusIssue,
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
                      child: IssueStatusTile(
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
