// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/tagihan/detail/tagihan_detail_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';

class TagihanDetailPage extends GetView<TagihanDetailController> {
  const TagihanDetailPage({super.key});

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
                  left: basePadding, right: basePadding, bottom: baseRadiusForm),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Iconsax.arrow_left, color: colorPrimary)),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(left: basePadding),
                      child: Text(
                        labelTagihan,
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
                          color: Colors.white,
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
                      child: Text("Iuran Kas 2024",
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
                            "Bulan ke 6 / 9",
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
                            "Rp. 30.000 / periode",
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
                            "30-10-2024",
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
            Padding(
              padding: EdgeInsets.only(bottom: basePadding, left: basePaddingInContent, right: basePaddingInContent),
              child: Text("Silahkan memilih pilihan di bawah ini untuk melakukan pembayaran",
                style: TextStyle(
                color: colorPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(baseRadiusCard)),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(basePaddingInContent),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text("Pilihan Rekening",
                          style: TextStyle(
                              color: colorTextSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    SizedBox(height: basePaddingInContent),
                    for (int i = 0; i < 3; i++)
                      RadioListTile(
                          title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text("123456897 ${i +1}",
                                style: TextStyle(
                                    fontSize: 16, color: colorTextSecondary, fontWeight: FontWeight.bold)),
                            Text("BCA a.n Naufal Hamdani",
                                style: TextStyle(
                                    fontSize: 12, color: colorTextSecondary))
                          ]),
                          value: i,
                          groupValue: "",
                          visualDensity: VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          contentPadding: EdgeInsets.zero,
                          onChanged: (value) {
                            controller.initMessage.value = value.toString();
                          }),
                  ]),
                )),
            SizedBox(height: basePadding),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(baseRadiusCard)),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(basePaddingInContent),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text("Pilihan Periode",
                          style: TextStyle(
                              color: colorTextSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    SizedBox(height: basePaddingInContent),
                    for (int i = 0; i < 4; i++)
                      CheckboxListTile(
                          title: Text("Bulan ke ${i+1}",
                              style: TextStyle(
                                  fontSize: 12, color: colorTextSecondary)),
                          value: false,
                          visualDensity: VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          contentPadding: EdgeInsets.zero,
                          onChanged: (value) {
                            controller.initMessage.value = value.toString();
                          }),
                  ]),
                )),
            SizedBox(height: basePadding),
            Align(
              alignment: Alignment.center,
              child: StandardButtonPrimary(
                onPressed: () {
                  _buildContentBottom(context);
                },
                titleHint: labelBtnProcess
              ),
            )
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
                            borderRadius: BorderRadius.circular(baseRadiusCard),
                            color: colorLight
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(basePaddingInContent),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Row(children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    labelAccountBankName,
                                    style: TextStyle(color: colorDark, fontSize: 11),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    ":",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: colorDark, fontSize: 11),
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
                                padding: EdgeInsets.only(top: basePaddingInContent),
                                child: Row(children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      labelAccountBank,
                                      style: TextStyle(color: colorDark, fontSize: 11),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ":",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: colorDark, fontSize: 11),
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
                                          borderRadius: BorderRadius.all(Radius.circular(baseRadiusCard)),
                                          color: colorDark
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(basePaddingInContent / 2),
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
                                padding: EdgeInsets.only(top: basePaddingInContent),
                                child: Row(children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      labelNominal,
                                      style: TextStyle(color: colorDark, fontSize: 11),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ":",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: colorDark, fontSize: 11),
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
                                          borderRadius: BorderRadius.all(Radius.circular(baseRadiusCard)),
                                          color: colorDark
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(basePaddingInContent / 2),
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
                                padding: EdgeInsets.only(top: basePaddingInContent),
                                child: Row(children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      labelNote,
                                      style: TextStyle(color: colorDark, fontSize: 11),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ":",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: colorDark, fontSize: 11),
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
                                      borderRadius: BorderRadius.all(Radius.circular(baseRadiusCard)),
                                      color: colorDark
                                    ),
                                      child: Padding(
                                        padding: EdgeInsets.all(basePaddingInContent / 2),
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
                                  style: TextStyle(color: colorDark, fontSize: 11, fontStyle: FontStyle.italic),
                                ),
                              )
                            ]),
                          ),
                        ),
                        SizedBox(height: basePadding),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(baseRadiusCard),
                            color: Colors.grey
                          ),
                          height: Get.height / 2,
                        ),
                        SizedBox(height: basePadding),
                        StandardButtonPrimary(
                            onPressed: () {
                            },
                            titleHint: labelBtnConfirm,
                          ),
                      ]),
                  )
                )
            )
    );
  }
}
