// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_controller.dart';
import 'package:parawarga_apps/modules/arisan/item/arisan_detail_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';

class ArisanDetailPage extends GetView<ArisanDetailController> {
  const ArisanDetailPage({super.key});

  static const argDataArisan = 'argDataArisan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContentTop(context),
    );
  }

  _buildContentTop(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: basePadding,
                  right: basePadding,
                  bottom: baseRadiusForm),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Iconsax.arrow_left, color: colorPrimary)),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(left: basePadding),
                      child: Text(
                        labelArisanDetail,
                        style: TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                )
              ]),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(basePadding),
                        topRight: Radius.circular(basePadding),
                      ),
                      color: colorPrimary),
                  child: Padding(
                      padding: EdgeInsets.only(top: baseRadiusForm),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(basePadding),
                            topRight: Radius.circular(basePadding),
                          ),
                          color: Colors.white,
                        ),
                        child: Obx(() {
                          return _buildContentMainMenu(context);
                        }),
                      ))),
            )
          ],
        ),
      ),
    );
  }

  _buildContentMainMenu(BuildContext context) {
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(basePadding),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(baseRadiusCard)),
                color: colorPrimary,
                child: Padding(
                  padding: EdgeInsets.all(basePaddingInContent),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text("Arisan Pkk Tahun 1",
                          style: TextStyle(
                              color: colorLight,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "RT.001 RW.003",
                        style: TextStyle(color: colorLight, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: basePaddingInContent),
                    Row(children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          labelDate,
                          style: TextStyle(color: colorLight, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: colorLight, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "30-10-2024",
                            style: TextStyle(
                                color: colorLight,
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
                          labelPeriode,
                          style: TextStyle(color: colorLight, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: colorLight, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "5",
                            style: TextStyle(
                                color: colorLight,
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
                          labelSubsciption,
                          style: TextStyle(color: colorLight, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: colorLight, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "30.000",
                            style: TextStyle(
                                color: colorLight,
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
                          labelTotal,
                          style: TextStyle(color: colorLight, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: colorLight, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "300.000",
                            style: TextStyle(
                                color: colorLight,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                  ]),
                )),
            Padding(
              padding: EdgeInsets.all(basePaddingInContent),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(
                    onTap: () {
                      controller.initLoadData.value = 0;
                    },
                    child: Column(children: [
                      Card(
                          color: colorLight,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(Iconsax.profile_2user, color: colorDark)))),
                      Text(labelTotalMember,
                          style: TextStyle(
                              color: colorTextPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ])),
                GestureDetector(
                    onTap: () {
                      controller.initLoadData.value = 1;
                    },
                    child: Column(children: [
                      Card(
                          color: colorLight,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(Iconsax.user_tick, color: colorDark)))),
                      Text(labelListOfWin,
                          style: TextStyle(
                              color: colorTextPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ])),
                GestureDetector(
                    onTap: () {
                      controller.initLoadData.value = 2;
                    },
                    child: Column(children: [
                      Card(
                          color: colorLight,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(Iconsax.user, color: colorDark)))),
                      Text(labelRemainingMember,
                          style: TextStyle(
                              color: colorTextPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ])),
              ]),
            ),
            _buildContentList(context)
          ]),
        ));
  }

  _buildContentList(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(baseRadiusCard)),
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(basePaddingInContent),
          child: Column(children: [
            Text((controller.initLoadData.value == 0)
                ? labelTotalMember
                : (controller.initLoadData.value == 1) ? labelListOfWin : labelRemainingMember,
                style: TextStyle(
                    color: colorPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            _buildContentTotalMember(context),
            _buildContentListOfWin(context),
            _buildContentRemainingMember(context),
          ]),
        )
    );
    }

  _buildContentTotalMember(BuildContext context) {
    return Visibility(
        visible: (controller.initLoadData.value == 0) ? true : false,
        child: Padding(
            padding: EdgeInsets.only(top: baseRadiusForm),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: baseRadiusForm),
                itemCount: controller.dataArisan["totalMember"].length,
                itemBuilder: (context, index) {
                  return ArisanDetailTile(
                    model: controller.dataArisan["totalMember"][index],
                    onPressed: (model) async {},
                  );
                })),
      );
  }

  _buildContentListOfWin(BuildContext context) {
    return Visibility(
        visible: (controller.initLoadData.value == 1) ? true : false,
        child: Padding(
            padding: EdgeInsets.only(top: baseRadiusForm),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: baseRadiusForm),
                itemCount: controller.dataArisan["winOfHistories"].length,
                itemBuilder: (context, index) {
                  return ArisanDetailTile(
                    model: controller.dataArisan["winOfHistories"][index],
                    onPressed: (model) async {},
                  );
                })),
      );
  }

  _buildContentRemainingMember(BuildContext context) {
    return Visibility(
        visible: (controller.initLoadData.value == 2) ? true : false,
        child: Padding(
            padding: EdgeInsets.only(top: baseRadiusForm),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: baseRadiusForm),
                itemCount: controller.dataArisan["availableMember"].length,
                itemBuilder: (context, index) {
                  return ArisanDetailTile(
                    model: controller.dataArisan["availableMember"][index],
                    onPressed: (model) async {},
                  );
                })),
      );
  }
}
