// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/laporan/input/laporan_input_controller.dart';
import 'package:parawarga_apps/modules/laporan/item/laporan_input_file_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/theme/standard_text_field.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../core/constants.dart';
import '../../../theme/app_theme.dart';

class LaporanInputPage extends GetView<LaporanInputController> {
  const LaporanInputPage({super.key});

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
                padding: EdgeInsets.only(left: basePadding, right: basePadding),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Iconsax.arrow_left, color: colorPrimary)),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: basePadding),
                            child: Text(
                              labelLaporanInput,
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
          StandardTextField(
              editingController: controller.editingControllers[0],
              titleHint: labelTopic,
              msgError: msgFieldEmpty,
              inputAction: TextInputAction.next),
          StandardTextField(
              editingController: controller.editingControllers[1],
              titleHint: labelDesc,
              msgError: msgFieldEmpty,
              inputAction: TextInputAction.next),
          StandardTextField(
              editingController: controller.editingControllers[2],
              titleHint: labelLocation,
              msgError: msgFieldEmpty,
              inputAction: TextInputAction.next),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: StandardTextField(
                editingController: controller.editingControllers[3],
                titleHint: labelLocation,
                msgError: msgFieldEmpty,
                isEnabled: false,
                inputAction: TextInputAction.next),
            ),
            Padding(
              padding: EdgeInsets.only(top: basePadding, right: basePadding),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: colorSecondary,
                  child: SizedBox(
                    width: 35,
                    child: Icon(Iconsax.add, color: colorDark),
                  ),
                ),
              ),
            ),
          ]),
          for (int i = 0; i < listHistory.length; i++)
            Padding(
                padding: EdgeInsets.only(
                    top: (i == 0) ? basePadding : baseRadiusForm,
                    left: basePadding,
                    right: basePadding,
                    bottom: (i == listHistory.length - 1)
                        ? basePadding
                        : baseRadiusForm),
                child: LaporanInputFileTile(
                    model: listHistory[i], onPressed: (model) async {})),
          StandardButtonPrimary(titleHint: labelSubmit)
        ]));
  }
}
