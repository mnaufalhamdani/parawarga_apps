// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/response/tagihan_temp_model.dart';
import 'package:parawarga_apps/modules/tagihan/pembayaran/tagihan_pembayaran_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/picker_dialog.dart';
import '../../../theme/standard_error_page.dart';

class TagihanPembayaranPage extends GetView<TagihanPembayaranController> {
  const TagihanPembayaranPage({super.key});

  static const argId = 'argId';

  @override
  Widget build(BuildContext context) {
    controller.getTagihanTemp();
    return Scaffold(
      appBar: AppBar(
        title: Text(labelTagihanPay, style: TextStyle(color: colorPrimary)),
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
              ))),
    );
  }

  _buildContentMainMenu(BuildContext context) {
    final data = controller.tagihanTempState.value.data;
    if (controller.tagihanTempState.value.isLoading) {
      return Container();
    }

    if (data == null || controller.tagihanTempState.value.error != null) {
      return StandardErrorPage(
        message: controller.tagihanTempState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getTagihanTemp();
        },
      );
    }

    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(basePadding),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildContentExpired(context, data),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(baseRadiusCard)),
                color: colorPrimary,
                child: Padding(
                  padding: EdgeInsets.all(basePaddingInContent),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    Text(
                      data.bankName.toString(),
                      style: TextStyle(
                          color: colorLight,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.accountName.toString(),
                      style: TextStyle(
                          color: colorLight,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          labelAccountBank,
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
                        flex: 7,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            data.accountNumber.toString(),
                            style: TextStyle(
                                color: colorLight,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: basePaddingInContent),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: data.accountNumber.toString()));
                          showStandardSnackbar(context, TypeMessage.info, message: labelCopied);
                        },
                        child: Icon(Iconsax.copy, color: colorLight, size: baseRadius)
                      )
                    ]),
                    SizedBox(height: basePaddingInContent),
                    Row(children: [
                      Expanded(
                        flex: 3,
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
                        flex: 7,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Rp. ${currencyFormat(data.totalNominal.toString())}",
                            style: TextStyle(
                                color: colorLight,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: basePaddingInContent),
                      GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: data.totalNominal.toString()));
                            showStandardSnackbar(context, TypeMessage.info, message: labelCopied);
                          },
                          child: Icon(Iconsax.copy, color: colorLight, size: baseRadius)
                      )
                    ]),
                    SizedBox(height: basePaddingInContent),
                    Row(children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          labelBeritaAcara,
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
                        flex: 7,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            data.beritaAcara.toString(),
                            style: TextStyle(
                                color: colorLight,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: basePaddingInContent),
                      GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: data.beritaAcara.toString()));
                            showStandardSnackbar(context, TypeMessage.info, message: labelCopied);
                          },
                          child: Icon(Iconsax.copy, color: colorLight, size: baseRadius)
                      )
                    ]),
                    SizedBox(height: basePaddingInContent),
                    ((data.status ?? 0) > 0)
                    ? Row(children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          labelStatus,
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
                        flex: 7,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            data.statusName.toString(),
                            style: TextStyle(
                                color: colorLight,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: basePaddingInContent),
                      GestureDetector(
                          onTap: () {
                          },
                          child: Icon(Iconsax.copy, color: colorPrimary, size: baseRadius)
                      )
                    ])
                    : Container(),
                  ]),
                )),
            _buildContentMessage(context, data),
            _buildContentAttachment(context, data),
            _buildContentButton(context, data)
          ]),
        ));
  }

  _buildContentExpired(BuildContext context, TagihanTempModel data) {
    return Visibility(
      visible: data.status == 0,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(baseRadiusCard)),
        color: Colors.red.shade700,
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.all(baseRadiusCard),
            child: Text("Mohon konfirmasi pembayaran sebelum ${data.expiredName}",
              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      )
    );
  }

  _buildContentMessage(BuildContext context, TagihanTempModel data) {
    return Visibility(
      visible: data.status == 0,
      child: Padding(
        padding: EdgeInsets.only(top: baseRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cara pembayaran :",
              style: TextStyle(color: colorTextTitle, fontSize: 11, fontWeight: FontWeight.bold),
            ),
            Text("- Pastikan nomor rekening yang Anda masukkan telah sesuai"
                "\n- Nominal transfer sesuai dengan nominal yang tertera di tagihan"
                "\n- Berita acara transfer harus sesuai dengan yang tertera di tagihan",
              style: TextStyle(color: colorTextMessage, fontSize: 11),
            ),
          ],
        )
      ),
    );
  }

  _buildContentAttachment(BuildContext context, TagihanTempModel data) {
    return Visibility(
      visible: data.status == 0 || data.status == 1 || data.status == 3,
      child: Padding(
        padding: EdgeInsets.only(top: baseRadius),
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
                  child: Text("Lampiran Bukti Pembayaran",
                      style: TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Pastikan lampiran bukti pembayaran terlihat jelas dan terbaca",
                      style: TextStyle(
                          color: colorTextMessage,
                          fontSize: 12)),
                ),
                GestureDetector(
                  onTap: () {
                    if (data.status == 0){
                      pickerDialog(context, (path) {
                        controller.tagihanReceipt.value = path;
                      });
                    }
                  },
                  child: SizedBox(
                      width: Get.width,
                      height: Get.height / 2,
                      child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(baseRadiusCard)),
                      color: colorBackground,
                      elevation: 0,
                          child: (controller.tagihanReceipt.value != null)
                              ? ClipRRect(
                                borderRadius: BorderRadius.circular(baseRadiusCard),
                                child: Image.file(File(controller.tagihanReceipt.value.toString()), fit: BoxFit.cover)
                              )
                              : Icon(Iconsax.document_upload, size: 40, color: colorPrimary)
                      )),
                ),
              ]),
            )
        ),
      ),
    );
  }

  _buildContentButton(BuildContext context, TagihanTempModel data) {
    return Visibility(
      visible: data.status == 0,
      child: Padding(
        padding: EdgeInsets.only(top: baseRadius, bottom: baseRadius),
          child: SizedBox(
            width: Get.width,
            child: StandardButtonPrimary(
              titleHint: labelBtnConfirm,
              isLoading: controller.tagihanPembayaranState.value.isLoading,
              onPressed: (() async {
                await controller.saveTagihanPembayaran().whenComplete(() async {
                  if(controller.tagihanPembayaranState.value.error != null) {
                    showStandardSnackbar(context, TypeMessage.error, message: controller.tagihanPembayaranState.value.error?.message.toString());
                  }else {
                    showStandardSnackbar(context, TypeMessage.success, message: controller.tagihanPembayaranState.value.data?.messages.toString());
                    await controller.getTagihanTemp();
                  }
                });
              })),
        ),
      ),
    );
  }
}
