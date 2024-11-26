// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/laporan/item/laporan_tile.dart';
import 'package:parawarga_apps/modules/laporan/laporan_controller.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../core/constants.dart';
import '../../theme/app_theme.dart';

class LaporanPage extends GetView<LaporanController> {
  const LaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContentTop(context),
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: colorSecondary,
          onPressed: () {
            Get.toNamed(Routes.laporanInput);
          },
          child: Icon(Iconsax.add, color: Colors.white)
      ),
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
        child: Column(children: [
          for (int i = 0; i < listLaporan.length; i++)
            Padding(
                padding: EdgeInsets.only(
                    top: (i == 0) ? basePadding : baseRadiusForm,
                    left: basePadding,
                    right: basePadding,
                    bottom: (i == listLaporan.length - 1) ? basePadding : baseRadiusForm),
                child: LaporanTile(
                  model: listLaporan[i],
                  onPressed: (model) async {
                    Get.toNamed(Routes.laporanDetail);
                  },
                ))
        ]));
  }
}
