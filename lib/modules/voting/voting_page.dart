// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/voting/detail/voting_detail_page.dart';
import 'package:parawarga_apps/modules/voting/item/voting_tile.dart';
import 'package:parawarga_apps/modules/voting/voting_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../routes/app_pages.dart';
import '../../theme/app_theme.dart';
import '../../theme/standard_error_page.dart';
import '../../theme/standard_snackbar.dart';

class VotingPage extends GetView<VotingController> {
  const VotingPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getVoting();
    return Scaffold(body: Obx(() => _buildContentTop(context)));
  }

  _buildContentTop(BuildContext context) {
    return Container(
      color: colorBackground,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery
            .of(context)
            .viewPadding
            .top),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .viewPadding
                  .top * 2,
              child: Padding(
                padding: EdgeInsets.only(
                    left: basePadding, right: basePadding),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center, children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Iconsax.arrow_left, color: colorPrimary)),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: basePadding),
                        child: Text(
                          labelVoting,
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
    final list = controller.votingState.value.data;
    if (controller.votingState.value.isLoading) {
      return Container();
    }

    if (list == null || list.isEmpty == true ||
        controller.votingState.value.error != null) {
      return StandardErrorPage(
        message: controller.votingState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getVoting();
        },
      );
    }

    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          for (int i = 0; i < list.length; i++)
            Padding(
                padding: EdgeInsets.only(
                    top: (i == 0) ? basePadding : baseRadiusForm,
                    left: basePadding,
                    right: basePadding,
                    bottom: (i == list.length - 1)
                        ? basePadding
                        : baseRadiusForm),
                child: VotingTile(
                  model: list[i],
                  onPressed: (model, value) async {
                    if(value.isEmpty) {
                      return showStandardSnackbar(context, TypeMessage.error, message: "Silahkan pilih salah satu pilihan yang tersedia");
                    }

                    await controller.saveVoted(model, value).whenComplete(() async {
                      if(controller.saveVotedState.value.data != null){
                        await controller.getVoting();
                      }else if(controller.saveVotedState.value.error != null){
                        showStandardSnackbar(context, TypeMessage.error, message: controller.saveVotedState.value.error?.message.toString());
                      }
                    });
                  },
                  onDetail: (model) {
                    Get.toNamed(Routes.votingDetail, arguments: {
                      VotingDetailPage.argId: model.id.toString()
                    });
                  },
                ))
        ]));
  }
}
