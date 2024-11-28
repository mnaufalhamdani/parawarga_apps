// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/laporan/detail/laporan_detail_controller.dart';
import 'package:parawarga_apps/modules/laporan/item/laporan_status_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../core/constants.dart';
import '../../../theme/app_theme.dart';

class LaporanDetailPage extends GetView<LaporanDetailController> {
  const LaporanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContentTop(context),
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
                    left: basePadding, right: basePadding),
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
                          labelLaporan,
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
          child: Column(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(baseRadiusForm),
                child: Image.network(height: 200, "https://www.visa.co.id/dam/VCOM/regional/ap/indonesia/global-elements/images/wonderful-indonesia-hot-deals-800x450.jpg", fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Icon(Iconsax.gallery_slash, color: colorTextSecondary);
                    })
            ),
            SizedBox(height: basePaddingInContent),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "RT.001 RW.003",
                  style: TextStyle(
                      color: colorTextSecondary, fontSize: 12),
                ),
                Text(
                  "30-12-2024",
                  style: TextStyle(
                      color: colorTextSecondary, fontSize: 12),
                )
              ]
            ),
            SizedBox(height: basePaddingInContent),
            Text(
              "Penegasan Kejagung Tak Ada Politisasi Terkait Penetapan Tersangka Tom Lembong",
              style: TextStyle(
                  color: colorTextPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(height: basePaddingInContent),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Iconsax.map_1, color: colorTextSecondary),
                  SizedBox(width: basePaddingInContent),
                  Text(
                    "Surabaya, Indonesia",
                    style: TextStyle(
                        color: colorTextSecondary, fontSize: 12),
                  )
                ]
            ),
            SizedBox(height: basePaddingInContent),
            Text(
              "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32. \n\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
              style: TextStyle(
                  color: colorTextSecondary, fontSize: 12),
            ),
            SizedBox(height: basePaddingInContent),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(baseRadiusCard),
                color: Colors.white
              ),
              child: Column(children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(baseRadiusCard), topRight: Radius.circular(baseRadiusCard)),
                    color: colorPrimary
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(basePaddingInContent),
                    child: Text(
                      "Status Laporan",
                      style: TextStyle(
                          color: colorLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: basePaddingInContent),
                for (int i = 0; i < listLaporan.length; i++)
                  Padding(
                    padding: EdgeInsets.only(
                        top: (i == 0) ? basePadding : baseRadiusForm,
                        left: basePadding,
                        right: basePadding,
                        bottom: (i == listLaporan.length - 1) ? basePadding : baseRadiusForm),
                    child: LaporanStatusTile(
                      model: listLaporan[i],
                      onPressed: (model) async {
                      },
                    ),
                  )
              ])
              )
          ]),
        ));
  }
}
