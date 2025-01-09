// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/modules/my_area/detail/my_area_detail_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';

class MyAreaDetailPage extends GetView<MyAreaDetailController> {
  const MyAreaDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(labelMyArea, style: TextStyle(color: colorPrimary)),
        centerTitle: true,
        backgroundColor: colorBackground,
        surfaceTintColor: colorBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorPrimary),
          onPressed: () { Get.back(); },
        ),
      ),
      body: _buildContentBackground(context),
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
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(baseRadiusCard)),
              color: Colors.white,
              child: Column(children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(baseRadiusCard),
                          topRight: Radius.circular(baseRadiusCard)),
                      color: colorPrimary),
                  child: Padding(
                    padding: EdgeInsets.all(baseRadiusForm),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Detail Area",
                              style: TextStyle(
                                  color: colorLight,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ]),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(baseRadiusForm),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                labelMyArea,
                                style: TextStyle(
                                    color: colorTextSecondary, fontSize: 11),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                ":",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: colorTextSecondary, fontSize: 11),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "RT.001 RW.003",
                                  style: TextStyle(
                                      color: colorTextSecondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ]),
                          Row(children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                labelStatus,
                                style: TextStyle(
                                    color: colorTextSecondary, fontSize: 11),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                ":",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: colorTextSecondary, fontSize: 11),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Trial License",
                                  style: TextStyle(
                                      color: colorTextSecondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ]),
                        ]))
              ]))
        ]));
  }
}
