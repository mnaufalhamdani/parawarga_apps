// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/domain/tagihan_domain.dart';
import 'package:parawarga_apps/models/response/tagihan_detail_model.dart';
import 'package:parawarga_apps/modules/tagihan/create/tagihan_create_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/single_select/single_select_dialog.dart';
import 'package:parawarga_apps/theme/single_select/single_select_domain.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/app_theme.dart';
import '../pembayaran/tagihan_pembayaran_page.dart';

class TagihanCreatePage extends GetView<TagihanCreateController> {
  const TagihanCreatePage({super.key});

  static const argTagihan = 'argTagihan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(labelTagihanCreate, style: TextStyle(color: colorPrimary)),
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
        body:
          Stack(
            children: [
              Obx(() => _buildContentBackground(context)),
              _buildContentButton(context)
            ]
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
    final data = controller.model;
    final sisaPeriode = int.parse(data.totalPeriode ?? "0") - int.parse(data.myPeriode ?? "0");

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
                          labelRemaining,
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
                            "$sisaPeriode $labelPeriode",
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
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          labelNote,
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
                            "Jika Anda ingin melakukan pembayaran secara tunai, silahkan hubungi pengelola Area",
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
            _buildContentPeriode(context, data, sisaPeriode),
            _buildContentBank(context, data),
            _buildContentMessage(context)
          ]),
        ));
  }

  _buildContentPeriode(BuildContext context, TagihanDetailModel data, int sisaPeriode) {
    return Padding(
      padding: EdgeInsets.only(top: baseRadius, bottom: baseRadius),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(baseRadiusCard)),
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(basePaddingInContent),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Pilih Periode",
                    style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
              GestureDetector(
                onTap: () {
                  final listItem = List<SingleSelectDomain>.empty(growable: true);
                  for (var i = 0; i < sisaPeriode; i++){
                    listItem.add(SingleSelectDomain(
                        codeOrId: i.toString(),
                        message: (i + 1).toString()
                    ));
                  }
                  SingleSelectDialog.show(context, "Pilih Jumlah Periode", listItem, (idIndex, model) {
                    controller.tagihanPeriode.value = int.parse(model.message ?? "0");
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(baseRadiusCard)),
                  color: colorBackground,
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(basePaddingInContent),
                    child: Column(
                      children: [
                        Row(children: [
                          Expanded(
                            flex: 7,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Jumlah periode yang akan dibayar",
                                style: TextStyle(color: colorTextMessage, fontSize: 11),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              ":",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: colorTextMessage, fontSize: 11),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                (controller.tagihanPeriode.value != 0)
                                ? "${controller.tagihanPeriode.value} $labelPeriode"
                                : labelChooseHere,
                                style: TextStyle(
                                    color: colorTextTitle,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ]),
                        Row(children: [
                          Expanded(
                            flex: 7,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Total Nominal yang akan dibayar",
                                style: TextStyle(color: colorTextMessage, fontSize: 11),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              ":",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: colorTextMessage, fontSize: 11),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                (controller.tagihanPeriode.value != 0)
                                    ? "Rp. ${currencyFormat((int.parse(data.nominal ?? "0") * controller.tagihanPeriode.value).toString())}"
                                    : labelChooseHere,
                                style: TextStyle(
                                    color: colorTextTitle,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ]),
                      ],
                    ),
                  )),
              ),
            ]),
          )
      ),
    );
  }

  _buildContentBank(BuildContext context, TagihanDetailModel data) {
    return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(baseRadiusCard)),
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(basePaddingInContent),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Pilih Rekening",
                    style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
              GestureDetector(
                onTap: () {
                  final listItem = List<SingleSelectDomain>.empty(growable: true);
                  for (var element in data.bank) {
                    final message = "${element.name} \n${element.accountNumber}";
                    listItem.add(SingleSelectDomain(
                      codeOrId: element.id,
                      message: message
                    ));
                  }
                  SingleSelectDialog.show(context, "Pilih Rekening", listItem, (idIndex, model) {
                    final bank = data.bank.firstWhere((element) => element.id == model.codeOrId);
                    final domain = TagihanTempDomain(
                        account_bank_id: bank.id,
                        account_number: bank.accountNumber,
                        account_name: bank.accountName,
                        bank_code_name: bank.bankCodeName,
                        bank_name: bank.name,
                    );
                    controller.tagihanTempDomain.value = domain;
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(baseRadiusCard)),
                  color: colorBackground,
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(basePaddingInContent),
                    child: Column(children: [
                      Row(children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            labelName,
                            style: TextStyle(color: colorTextMessage, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            ":",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: colorTextMessage, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.tagihanTempDomain.value.account_name ?? labelChooseHere,
                              style: TextStyle(
                                  color: colorTextTitle,
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
                            labelBank,
                            style: TextStyle(color: colorTextMessage, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            ":",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: colorTextMessage, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.tagihanTempDomain.value.bank_name ?? labelChooseHere,
                              style: TextStyle(
                                  color: colorTextTitle,
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
                            labelAccountBank,
                            style: TextStyle(color: colorTextMessage, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            ":",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: colorTextMessage, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.tagihanTempDomain.value.account_number ?? labelChooseHere,
                              style: TextStyle(
                                  color: colorTextTitle,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ]),
                    ]),
                  )),
              ),
            ]),
          )
      );
  }

  _buildContentMessage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: baseRadius, bottom: baseRadius * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$labelNote :",
            style: TextStyle(color: colorTextTitle, fontSize: 11, fontWeight: FontWeight.bold),
          ),
          Text("- Pilih periode dan rekening serta buat tagihan terlebih dahulu"
              "\n- Pastikan nominal transfer sesuai dengan nominal yang tertera di tagihan"
              "\n- Cantumkan berita acara transfer sesuai dengan yang tertera di tagihan",
            style: TextStyle(color: colorTextMessage, fontSize: 11),
          ),
        ],
      )
    );
  }

  _buildContentButton(BuildContext context) {
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
                      child: Text("Pastikan pilihan Anda sudah sesuai.",
                        style: TextStyle(color: colorTextMessage, fontSize: 12),
                      )
                  ),
                  SizedBox(width: basePaddingInContent),
                  StandardButtonPrimary(
                      titleHint: labelTagihanCreate,
                      isLoading: controller.tagihanTempState.value.isLoading,
                      onPressed: (() async {
                        await controller.saveTagihanTemp().whenComplete(() {
                          if(controller.tagihanTempState.value.error != null) {
                            showStandardSnackbar(context, TypeMessage.error, message: controller.tagihanTempState.value.error?.message.toString());
                          }else {
                            final tempId = controller.tagihanTempState.value.data?.data.toString();
                            Get.offNamedUntil(Routes.tagihanPembayaran, ModalRoute.withName(Routes.dashboard), arguments: {
                              TagihanPembayaranPage.argId: tempId
                            });
                          }
                        });
                  }))
                ],
              ),
            )
        ));
  }
}
