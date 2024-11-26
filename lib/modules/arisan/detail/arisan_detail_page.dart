// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_controller.dart';
import 'package:parawarga_apps/modules/arisan/item/arisan_detail_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/standard_button_primary.dart';

class ArisanDetailPage extends GetView<ArisanDetailController> {
  const ArisanDetailPage({super.key});

  static const argDataArisan = 'argDataArisan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContentTop(context),
      floatingActionButton: Obx(() =>
          Visibility(visible: controller.initLoading.value,
              child: FloatingActionButton(
                  shape: CircleBorder(),
                  backgroundColor: colorSecondary,
                  onPressed: () {
                    _buildContentBottom(context);
                  },
                  child: Icon(Iconsax.convert_3d_cube, color: colorDark)
              )
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _buildContentTop(BuildContext context) {
    return Container(
      color: colorBackground,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top * 2,
              child: Padding(
                padding: EdgeInsets.only(
                    left: basePadding,
                    right: basePadding),
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                            "5 / 9",
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(
                    onTap: () {
                      controller.initLoadData.value = 0;
                    },
                    child: Column(children: [
                      Card(
                          color: colorSecondary,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(Iconsax.profile_2user,
                                      color: colorDark)))),
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
                          color: colorSecondary,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(
                                      Iconsax.user_tick, color: colorDark)))),
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
                          color: colorSecondary,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: Icon(
                                      Iconsax.user, color: colorDark)))),
                      Text(labelRemainingMember,
                          style: TextStyle(
                              color: colorTextPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ])),
              ]),
            ),
            _buildContentAdv(context),
            _buildContentList(context)
          ]),
        ));
  }

  _buildContentAdv(BuildContext context) {
    return Visibility(
        child: Padding(
          padding: EdgeInsets.only(bottom: basePadding),
          child: Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            elevation: 2,
            child: Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(baseRadiusForm),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://bithourproduction.com/blog/wp-content/uploads/2023/08/EmJaSRjUcAAPkTv.jpg"),
                        fit: BoxFit.cover))),
          ),
        ));
  }

  _buildContentList(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(baseRadiusCard)),
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(basePaddingInContent),
          child: Column(children: [
            Text((controller.initLoadData.value == 0)
                ? labelTotalMember
                : (controller.initLoadData.value == 1)
                ? labelListOfWin
                : labelRemainingMember,
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

  _buildContentBottom(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(baseRadiusCard))),
        builder: (context) =>
            FractionallySizedBox(
                heightFactor: 0.9,
                child: Padding(
                  padding: EdgeInsets.all(basePadding),
                  child: Obx(() {
                    return Column(children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text("Arisan Pkk Tahun 1",
                            style: TextStyle(
                                color: colorTextSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(basePadding),
                        child: SizedBox(
                          height: Get.height / 3,
                          child: FortuneWheel(
                            indicators: [
                              FortuneIndicator(
                                alignment: Alignment.topCenter,
                                child: TriangleIndicator(
                                  color: colorSecondary,
                                  elevation: 2,
                                ),
                              ),
                            ],
                            animateFirst: false,
                            duration: Duration(seconds: 5),
                            selected: controller.stramController.value.stream,
                            items: [
                              for (int i = 0; i <
                                  controller.dataArisan["availableMember"]
                                      .length; i++)
                                FortuneItem(
                                  child: Text(controller
                                      .dataArisan["availableMember"][i]["name"]),
                                  style: FortuneItemStyle(
                                    color: (i % 2 == 0)
                                        ? colorPrimary
                                        : colorDark,
                                    borderColor: Colors.transparent,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Pengacakan saat ini untuk mendapatkan pemenang periode 5 (30-10-2024).\nPeserta arisan yang pernah menjadi pemenang sebelumnya tidak akan menjadi pemenang berikutnya",
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 12),
                        ),
                      ),
                      SizedBox(height: basePadding),
                      Visibility(
                        visible: (controller.bottomSheetData.value["isEnableButton"] == true) ? true : false,
                        child: StandardButtonPrimary(
                          onPressed: () {
                            if (controller.bottomSheetData.value["isEnableButton"] == true) {
                              controller.bottomSheetData.value["isEnableButton"] = false;
                              var dice = Fortune.randomInt(0, controller.dataArisan["availableMember"].length);
                              controller.stramController.value.add(dice);
                              Future.delayed(Duration(seconds: 5), () {
                                controller.bottomSheetData.value["valueDice"] = dice.toString();
                                controller.showResult.value = true;
                              });
                            }
                          },
                          titleHint: labelRandomNow,
                        ),
                      ),
                      Visibility(
                        visible: controller.showResult.value,
                        child: Card(
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
                                  child: Text("Pemenang Periode 5",
                                      style: TextStyle(
                                          color: colorLight,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16))
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(basePaddingInContent),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    controller.bottomSheetData.value["valueDice"].toString(),
                                    style: TextStyle(color: colorTextSecondary, fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ]))
                      ),
                    ]);
                  }),
                )
            )
    );
  }
}
