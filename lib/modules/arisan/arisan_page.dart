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

import '../../theme/app_theme.dart';
import '../../theme/standard_error_page.dart';

class ArisanPage extends GetView<ArisanController> {
  const ArisanPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getArisan();
    return Scaffold(body: Obx(() => _buildContentTop(context)));
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
                          labelArisan,
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
    final list = controller.arisanState.value.data;
    if (controller.arisanState.value.isLoading) {
      return Container();
    }

    if (list == null || list.isEmpty == true ||
        controller.arisanState.value.error != null) {
      return StandardErrorPage(
        message: controller.arisanState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getArisan();
        },
      );
    }

    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          for (int i = 0; i < list.length; i++)
            Padding(
                padding: EdgeInsets.only(
                    top: (i == 0) ? basePaddingInContent : basePaddingInContent / 2,
                    left: basePaddingInContent,
                    right: basePaddingInContent,
                    bottom: (i == list.length - 1)
                        ? basePaddingInContent
                        : basePaddingInContent / 2),
                child: ArisanTile(
                  model: list[i],
                  onPressed: (model) async {
                    Get.toNamed(Routes.arisanDetail, arguments: {
                      ArisanDetailPage.argId: model.id
                    });
                  },
                ))
        ]));
  }
}
