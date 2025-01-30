// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/response/tagihan_detail_model.dart';
import 'package:parawarga_apps/modules/tagihan/create/tagihan_create_page.dart';
import 'package:parawarga_apps/modules/tagihan/detail/tagihan_detail_controller.dart';
import 'package:parawarga_apps/modules/tagihan/item/tagihan_detail_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/standard_error_page.dart';

class TagihanDetailPage extends GetView<TagihanDetailController> {
  const TagihanDetailPage({super.key});

  static const argId = 'argId';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(labelTagihanDetail, style: TextStyle(color: colorPrimary)),
          centerTitle: true,
          backgroundColor: colorBackground,
          surfaceTintColor: colorBackground,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: colorPrimary),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(() =>
            Stack(
              children: [
                _buildContentBackground(context),
                _buildContentButton(context)
              ],
            )
        ));
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
              ))),
    );
  }

  _buildContentMainMenu(BuildContext context) {
    final data = controller.tagihanState.value.data;
    if (controller.tagihanState.value.isLoading) {
      return Container();
    }

    if (data == null || controller.tagihanState.value.error != null) {
      return StandardErrorPage(
        message: controller.tagihanState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getTagihanDetail();
        },
      );
    }

    var periodeName = labelYear;
    if(data.periodeType == "week"){
      periodeName = labelWeek;
    }else if(data.periodeType == "month"){
      periodeName = labelMonth;
    }

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
                            "${data.periode} / ${data.totalPeriode}",
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
                          labelNominal,
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
                            "Rp. ${currencyFormat(
                                data.nominal.toString())} / $labelPeriode ($periodeName)",
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
                          labelExpired,
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
                            data.endPeriode.toString(),
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
            _buildContentAdv(context),
            _buildContentHistory(context, data),
            _buildContentList(context, data)
          ]),
        ));
  }

  _buildContentAdv(BuildContext context) {
    return Visibility(
        child: Padding(
          padding: EdgeInsets.only(top: basePadding, bottom: basePadding),
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

  _buildContentHistory(BuildContext context, TagihanDetailModel data) {
    return Container(
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (int i = 0; i <
                  data.history.length; i++)
                Padding(
                    padding: EdgeInsets.only(
                        left: (i == 0) ? 0 : baseRadiusCard / 2,
                        right: (i == data.history.length - 1)
                            ? 0
                            : baseRadiusCard / 2),
                    child: TagihanHistoryTile(
                      model: data.history[i],
                      index: i,
                      indexSelected: controller.tagihanHistory.value,
                      onPressed: (model, index) async {
                        controller.tagihanHistory.value = index;
                      },
                    ))
            ])));
  }

  _buildContentList(BuildContext context, TagihanDetailModel data) {
    var tagihanHistory = List<User>.empty(growable: true);
    for (var element in data.history[controller.tagihanHistory.value].user) {
      tagihanHistory.add(element);
    }

    return Padding(
      padding: EdgeInsets.only(bottom: baseRadius * 5),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(baseRadiusCard)),
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(basePaddingInContent),
            child: Column(children: [
              Text("Periode ${data.history[controller.tagihanHistory.value].periode} (Rp. ${currencyFormat(data.history[controller.tagihanHistory.value].total.toString())})",
                  style: TextStyle(
                      color: colorPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              (tagihanHistory.isEmpty)
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
                    itemCount: tagihanHistory.length,
                    itemBuilder: (context, index) {
                      return TagihanDetailTile(
                        model: tagihanHistory[index],
                        userId: controller.userId.value,
                        onPressed: (model) async {},
                      );
                    })
                )
            ]),
          )
      ),
    );
  }

  _buildContentButton(BuildContext context) {
    final data = controller.tagihanState.value.data;
    if (data == null) {
      return Container();
    }

    return Align(alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(baseRadiusCard),
            topRight: Radius.circular(baseRadiusCard),
          ),
          color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(baseRadius),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  (data.myPeriode.toString() == "0")
                  ? "Anda belum membayar tagihan ini. \nApakah Anda akan membayarnya?"
                  : "Anda telah membayar tagihan ini selama ${data.myPeriode} periode. \nApakah Anda akan membayar periode selanjutnya?",
                  style: TextStyle(color: colorTextMessage, fontSize: 12),
                )
              ),
              SizedBox(width: basePaddingInContent),
              StandardButtonPrimary(titleHint: labelYes, onPressed: (() {
                Get.toNamed(Routes.tagihanCreate, arguments: {
                  TagihanCreatePage.argTagihan: data
                });
              }))
            ],
          ),
        )
      ));
  }

}
