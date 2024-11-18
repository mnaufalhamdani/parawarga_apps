// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/arisan/arisan_controller.dart';
import 'package:parawarga_apps/modules/arisan/detail/arisan_detail_page.dart';
import 'package:parawarga_apps/modules/arisan/item/arisan_tile.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../core/constants.dart';
import '../../theme/app_theme.dart';

class ArisanPage extends GetView<ArisanController> {
  const ArisanPage({super.key});

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
                        labelArisan,
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
          for (int i = 0; i < listArisan.length; i++)
            Padding(
                padding: EdgeInsets.only(
                    top: (i == 0) ? basePadding : baseRadiusForm,
                    left: basePadding,
                    right: basePadding,
                    bottom: (i == listArisan.length - 1) ? basePadding : baseRadiusForm),
                child: ArisanTile(
                  model: listArisan[i],
                  onPressed: (model) async {
                    Get.toNamed(Routes.arisanDetail, arguments: {
                      ArisanDetailPage.argDataArisan: model
                    });
                  },
                ))
        ]));
  }
}
