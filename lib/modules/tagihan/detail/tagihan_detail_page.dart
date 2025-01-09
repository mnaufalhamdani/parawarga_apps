// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/response/tagihan_detail_model.dart';
import 'package:parawarga_apps/modules/tagihan/detail/tagihan_detail_controller.dart';
import 'package:parawarga_apps/modules/tagihan/item/tagihan_detail_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/standard_error_page.dart';

class TagihanDetailPage extends GetView<TagihanDetailController> {
  const TagihanDetailPage({super.key});

  static const argId = 'argId';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(labelTagihan, style: TextStyle(color: colorPrimary)),
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
                Align(alignment: Alignment.bottomCenter,
                    child: _buildContentButton(context))
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
                                data.nominal.toString())} / $labelPeriode",
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

    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(baseRadiusCard)),
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(basePaddingInContent),
          child: Column(children: [
            Text("Periode ${data.history[controller.tagihanHistory.value]
                .periode}",
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
    );
  }

  _buildContentButton(BuildContext context) {
    final data = controller.tagihanState.value.data;
    if (data != null) {
      return Container(
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
                    "Anda telah membayar tagihan selama ${data.myPeriode}. \nApakah Anda akan membayar tagihan untuk periode berikutnya?",
                    style: TextStyle(color: colorTextlabel, fontSize: 12),
                  )
                ),
                StandardButtonPrimary(titleHint: "Bayar Sekarang!")
              ],
            ),
          )
      );
    }
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
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text("Iuran Kas 2024",
                              style: TextStyle(
                                  color: colorTextSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                        SizedBox(height: basePaddingInContent),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Anda telah memilih membayar untuk 4x periode dengan total nominal dibawah ini. Pastikan Anda melakukan pembayaran dengan ketentuan berikut ini.",
                            style: TextStyle(
                                color: colorTextSecondary, fontSize: 12),
                          ),
                        ),
                        SizedBox(height: basePadding),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  baseRadiusCard),
                              color: colorLight
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(basePaddingInContent),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        labelAccountBankName,
                                        style: TextStyle(
                                            color: colorDark, fontSize: 11),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        ":",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: colorDark, fontSize: 11),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "BCA a.n Naufal Hamdani",
                                          style: TextStyle(
                                              color: colorDark,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: basePaddingInContent),
                                    Expanded(flex: 2, child: SizedBox())
                                  ]),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: basePaddingInContent),
                                    child: Row(children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          labelAccountBank,
                                          style: TextStyle(
                                              color: colorDark, fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          ":",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: colorDark, fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "123456789",
                                            style: TextStyle(
                                                color: colorDark,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: basePaddingInContent),
                                      Expanded(flex: 2, child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      baseRadiusCard)),
                                              color: colorDark
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                basePaddingInContent / 2),
                                            child: Text(
                                              labelCopy,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: colorLight,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ))
                                      )
                                    ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: basePaddingInContent),
                                    child: Row(children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          labelNominal,
                                          style: TextStyle(
                                              color: colorDark, fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          ":",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: colorDark, fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "Rp. 30.000",
                                            style: TextStyle(
                                                color: colorDark,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: basePaddingInContent),
                                      Expanded(flex: 2, child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      baseRadiusCard)),
                                              color: colorDark
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                basePaddingInContent / 2),
                                            child: Text(
                                              labelCopy,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: colorLight,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ))
                                      )
                                    ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: basePaddingInContent),
                                    child: Row(children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          labelNote,
                                          style: TextStyle(
                                              color: colorDark, fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          ":",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: colorDark, fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "INV12345678",
                                            style: TextStyle(
                                                color: colorDark,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: basePaddingInContent),
                                      Expanded(flex: 2, child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      baseRadiusCard)),
                                              color: colorDark
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                basePaddingInContent / 2),
                                            child: Text(
                                              labelCopy,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: colorLight,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ))
                                      )
                                    ]),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "Masukkan catatan sesuai isian di atas",
                                      style: TextStyle(color: colorDark,
                                          fontSize: 11,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(height: basePadding),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  baseRadiusCard),
                              color: Colors.grey
                          ),
                          height: Get.height / 2,
                        ),
                        SizedBox(height: basePadding),
                        StandardButtonPrimary(
                          onPressed: () {},
                          titleHint: labelBtnConfirm,
                        ),
                      ]),
                    )
                )
            )
    );
  }
}
