// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(labelVoting, style: TextStyle(color: colorPrimary)),
        centerTitle: true,
        backgroundColor: colorBackground,
        surfaceTintColor: colorBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorPrimary),
          onPressed: () { Get.back(); },
        ),
      ),
      body: Obx(() => _buildContentBackground(context))
    );
  }

  _buildContentBackground(BuildContext context) {
    return Container(
      color: colorBackground,
      child: Expanded(
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
