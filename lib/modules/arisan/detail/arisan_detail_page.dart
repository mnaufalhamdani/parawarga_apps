// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:async';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/core/data_state.dart';
import 'package:parawarga_apps/models/domain/arisan_domain.dart';
import 'package:parawarga_apps/models/response/ArisanDetailModel.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_controller.dart';
import 'package:parawarga_apps/modules/arisan/item/arisan_detail_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/standard_button_primary.dart';
import '../../../theme/standard_error_page.dart';

class ArisanDetailPage extends GetView<ArisanDetailController> {
  const ArisanDetailPage({super.key});

  static const argDataArisan = 'argDataArisan';
  static const argId = 'argId';

  @override
  Widget build(BuildContext context) {
    controller.getArisanDetail();
    return Scaffold(
      body: Obx(() =>_buildContentTop(context)),
      floatingActionButton: Obx(() =>
          Visibility(visible: controller.arisanState.value.data?.timeToDice == true,
              child: FloatingActionButton(
                  shape: CircleBorder(),
                  backgroundColor: colorSecondary,
                  onPressed: () {
                    final data = controller.arisanState.value.data;
                    if (data != null) {
                      _buildContentBottom(context, data);
                    }
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
                        child: _buildContentMainMenu(context)
                      ))),
            )
          ],
        ),
      ),
    );
  }

  _buildContentMainMenu(BuildContext context) {
    final data = controller.arisanState.value.data;
    if (controller.arisanState.value.isLoading) {
      return Container();
    }

    if (data == null || controller.arisanState.value.error != null) {
      return StandardErrorPage(
        message: controller.arisanState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getArisanDetail();
        },
      );
    }

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(basePadding),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
        badges.Badge(
        showBadge: data.currentPeriode == data.totalPeriode,
            position: badges.BadgePosition.topEnd(top: -5, end: -5),
            badgeContent: Icon(Icons.check, color: Colors.white, size: baseRadius / 1.5),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.instagram,
              badgeColor: colorDark,
            ),
            child:
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(baseRadiusCard)),
                color: colorPrimary,
                child: Padding(
                  padding: EdgeInsets.all(basePaddingInContent),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        data.areaName.toString(),
                        style: TextStyle(color: colorLight, fontSize: 12),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(data.name.toString(),
                          style: TextStyle(
                              color: colorLight,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    SizedBox(height: basePaddingInContent),
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
                            "${
                                (data.currentPeriode == data.totalPeriode)
                                    ? data.currentPeriode
                                    : int.parse(data.currentPeriode.toString()) + 1
                            } / ${data.totalPeriode}",
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
                            data.datePeriode.toString(),
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
                            currencyFormat(data.nominal.toString()),
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
                            currencyFormat(data.totalPayed.toString()),
                            style: TextStyle(
                                color: colorLight,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                  ]),
                ))),
          Padding(
            padding: EdgeInsets.all(basePaddingInContent),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () {
                    _buildFilterHistoryBottom(context, data);
                  },
                  child: Column(children: [
                    Card(
                        color: colorSecondary,
                        child: Padding(
                            padding: EdgeInsets.all(basePaddingInContent),
                            child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(Iconsax.profile_2user,
                                    color: colorDark)))),
                    Text(labelHistory,
                        style: TextStyle(
                            color: colorTextPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12))
                  ])),
              GestureDetector(
                  onTap: () {
                    controller.arisanLabel.value = labelTotalOfWin;
                    controller.arisanClicked.value = 0;
                  },
                  child: Column(children: [
                    Card(
                        color: colorSecondary,
                        child: Padding(
                            padding: EdgeInsets.all(basePaddingInContent),
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(children: [
                                  Text(data.detail.where((element) => element.winDate != null).length.toString(),
                                      style: TextStyle(
                                          color: colorDark,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                  Text(labelMember,
                                      style: TextStyle(
                                          color: colorDark, fontSize: 12))
                                ]),
                              ),
                            ))),
                    Text(labelTotalOfWin,
                        style: TextStyle(
                            color: colorTextPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12))
                  ])),
              GestureDetector(
                  onTap: () {
                    controller.arisanLabel.value = labelRemainingMember;
                    controller.arisanClicked.value = 1;
                  },
                  child: Column(children: [
                    Card(
                        color: colorSecondary,
                        child: Padding(
                            padding: EdgeInsets.all(basePaddingInContent),
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(children: [
                                  Text(data.detail.where((element) => element.winDate == null).length.toString(),
                                      style: TextStyle(
                                          color: colorDark,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22)),
                                  Text(labelMember,
                                      style: TextStyle(
                                          color: colorDark, fontSize: 12))
                                ]),
                              ),
                            ))),
                    Text(labelRemainingMember,
                        style: TextStyle(
                            color: colorTextPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12))
                  ])),

              // GestureDetector(
              //     onTap: () {
              //       controller.initLoadData.value = 1;
              //     },
              //     child: Column(children: [
              //       Card(
              //           color: colorSecondary,
              //           child: Padding(
              //               padding: EdgeInsets.all(baseRadiusForm),
              //               child: SizedBox(
              //                   width: 35,
              //                   height: 35,
              //                   child: Icon(
              //                       Iconsax.user_tick, color: colorDark)))),
              //       Text(labelTotalOfWin,
              //           style: TextStyle(
              //               color: colorTextPrimary,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 12))
              //     ])),
              // GestureDetector(
              //     onTap: () {
              //       controller.initLoadData.value = 2;
              //     },
              //     child: Column(children: [
              //       Card(
              //           color: colorSecondary,
              //           child: Padding(
              //               padding: EdgeInsets.all(baseRadiusForm),
              //               child: SizedBox(
              //                   width: 35,
              //                   height: 35,
              //                   child: Icon(
              //                       Iconsax.user, color: colorDark)))),
              //       Text(labelRemainingMember,
              //           style: TextStyle(
              //               color: colorTextPrimary,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 12))
              //     ])),
            ]),
          ),
          _buildContentAdv(context),
          _buildContentList(context, data)
        ]),
      )
    );
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

  _buildContentList(BuildContext context, ArisanDetailModel data) {
    var arisanList = List<Detail>.empty(growable: true);
    var arisanHistory = List<User>.empty(growable: true);
    if(controller.arisanClicked.value == 0) {
      arisanList.clear();
      for (var element in data.detail) {
        if(element.winDate != null){
          arisanList.add(element);
        }
      }
    }else if(controller.arisanClicked.value == 1) {
      arisanList.clear();
      for (var element in data.detail) {
        if(element.winDate == null){
          arisanList.add(element);
        }
      }
    }else {
      arisanHistory.clear();
      for (var element in data.history[controller.arisanHistory.value].user) {
        arisanHistory.add(element);
      }

      return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(baseRadiusCard)),
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(basePaddingInContent),
            child: Column(children: [
              Text(controller.arisanLabel.value,
                  style: TextStyle(
                      color: colorPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              (arisanHistory.isEmpty)
                  ? StandardErrorPage(
                message: msgNotFound,
                onPressed: () {},
              )
                  : Padding(
                  padding: EdgeInsets.only(top: baseRadiusForm),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: baseRadiusForm),
                      itemCount: arisanHistory.length,
                      itemBuilder: (context, index) {
                        return ArisanHistoryTile(
                          model: arisanHistory[index],
                          onPressed: (model) async {},
                        );
                      })
              )
            ]),
          )
      );
    }

    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(baseRadiusCard)),
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(basePaddingInContent),
          child: Column(children: [
            Text(controller.arisanLabel.value,
                style: TextStyle(
                    color: colorPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            (arisanList.isEmpty)
                ? StandardErrorPage(
                    message: msgNotFound,
                    onPressed: () {},
                  )
                : Padding(
                  padding: EdgeInsets.only(top: baseRadiusForm),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: baseRadiusForm),
                    itemCount: arisanList.length,
                    itemBuilder: (context, index) {
                      return ArisanDetailTile(
                        model: arisanList[index],
                        onPressed: (model) async {},
                      );
                    })
            )
          ]),
        )
    );
  }

  _buildFilterHistoryBottom(BuildContext context, ArisanDetailModel data) {
    return showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => FractionallySizedBox(
            heightFactor: 0.5,
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.all(basePadding),
                  child: Text("Pilih Salah Satu Tanggal",
                      style: TextStyle(
                          color: colorTextlabel,
                          fontWeight: FontWeight.bold,
                          fontSize: 16))),
              (data.history.isEmpty)
                ? StandardErrorPage(message: msgNotFound)
                : Expanded(child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data.history.length,
                  itemBuilder: (context, index) {
                    return FilterHistoryTile(
                      model: data.history[index],
                      index: index,
                      onPressed: (model, index) {
                        controller.arisanLabel.value = "$labelHistory Pembayaran ${model.periodeName}";
                        controller.arisanClicked.value = null;
                        controller.arisanHistory.value = index;

                        Get.back();
                      },
                    );
                  },
                ))
        ]
    )));
  }

  _buildContentBottom(BuildContext context, ArisanDetailModel data) {
    final remainingMemeber = data.detail.where((element) => element.winDate == null);
    final stramController = StreamController<int>();

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
                        child: Text(data.name.toString(),
                            style: TextStyle(
                                color: colorTextSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      (remainingMemeber.length > 1)
                        ? Padding(
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
                              selected: stramController.stream,
                              items: [
                                for (int i = 0; i < remainingMemeber.length; i++)
                                  FortuneItem(
                                    child: Text(remainingMemeber.elementAt(i).createdName.toString()),
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
                        )
                        : Container(),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Pengacakan saat ini untuk mendapatkan pemenang periode ${data.datePeriode}.\nPeserta yang pernah menjadi pemenang sebelumnya tidak akan menjadi pemenang berikutnya",
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 12),
                        ),
                      ),
                      SizedBox(height: basePaddingInContent),
                      Visibility(
                        visible: (data.timeToDice == true) ? true : false,
                        child: StandardButtonPrimary(
                          isLoading: controller.arisanWinnerState.value.isLoading == true,
                          isEnabled: (controller.arisanWinnerState.value.data == null) ? true : false,
                          titleHint: labelRandomNow,
                          onPressed: () async {
                            if (controller.arisanWinnerDomain.value.user_id == null) {
                              var dice = Fortune.randomInt(0, remainingMemeber.length);

                              controller.arisanWinnerDomain.value = ArisanWinnerDomain(
                                  dice: dice,
                                  arisan_id: data.id,
                                  user_id: int.parse(remainingMemeber.elementAt(dice).userId.toString()),
                                  name: remainingMemeber.elementAt(dice).createdName,
                                  periode: data.periode,
                                  win_date: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
                                  win_nominal: data.totalPayed,
                              );
                            }

                            if (controller.arisanWinnerDomain.value.dice != null) {
                              stramController.add(controller.arisanWinnerDomain.value.dice ?? 0);
                            }

                            await controller.saveArisanWinner();
                          },
                        ),
                      ),
                      SizedBox(height: basePaddingInContent),
                      Visibility(
                          visible: (controller.arisanWinnerState.value.data != null) ? true : false,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      baseRadiusCard)),
                              color: Colors.white,
                              child: Column(children: [
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              baseRadiusCard),
                                          topRight: Radius.circular(
                                              baseRadiusCard)),
                                      color: colorPrimary),
                                  child: Padding(
                                      padding: EdgeInsets.all(baseRadiusForm),
                                      child: Text("Pemenang Periode ${data.datePeriode}",
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
                                      controller.arisanWinnerDomain.value.name.toString(),
                                      style: TextStyle(
                                          color: colorTextSecondary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ]))
                      ),
                      Visibility(
                          visible: (controller.arisanWinnerState.value.error != null) ? true : false,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      baseRadiusCard)),
                              color: Colors.white,
                              child: Column(children: [
                                Padding(
                                  padding: EdgeInsets.all(basePaddingInContent),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.arisanWinnerState.value.error?.message ?? msgKoneksiError,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12),
                                    ),
                                  ),
                                )
                              ]))
                      ),
                    ]);
                  }),
                )
            )
    ).whenComplete(() {
      controller.arisanWinnerDomain.value = ArisanWinnerDomain();
      controller.arisanWinnerState.value = ResponseState.def();
      controller.getArisanDetail();
      stramController.close();
    });
  }
}
