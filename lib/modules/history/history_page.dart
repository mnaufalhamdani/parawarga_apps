// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/modules/history/history_controller.dart';
import 'package:parawarga_apps/modules/history/item/history_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../routes/app_pages.dart';
import '../../theme/app_theme.dart';
import '../../theme/standard_error_page.dart';
import '../arisan/detail/arisan_detail_page.dart';
import '../issue/detail/issue_detail_page.dart';
import '../tagihan/pembayaran/tagihan_pembayaran_page.dart';
import '../voting/detail/voting_detail_page.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getHistory();
    return Scaffold(
      appBar: AppBar(
        title: Text(labelHistory, style: TextStyle(color: colorPrimary)),
        centerTitle: true,
        backgroundColor: colorBackground,
        surfaceTintColor: colorBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorPrimary),
          onPressed: () { Get.back(); },
        ),
      ),
      body: Obx(() => _buildContentBackground(context)),
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
              )))
    );
  }

  _buildContentMainMenu(BuildContext context) {
    final list = controller.historyState.value.data;
    if (controller.historyState.value.isLoading) {
      return Container();
    }

    if (list == null || list.isEmpty == true ||
        controller.historyState.value.error != null) {
      return StandardErrorPage(
        message: controller.historyState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getHistory();
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
                    bottom: (i == list.length - 1) ? basePaddingInContent : basePaddingInContent),
                child: HistoryTile(
                  model: list[i],
                  onPressed: (model) async {
                    if (model.typeMenu == "tagihan"){
                      Get.toNamed(Routes.tagihanPembayaran, arguments: {
                        TagihanPembayaranPage.argId: model.id
                      });
                    }else if(model.typeMenu == "voting") {
                      Get.toNamed(Routes.votingDetail, arguments: {
                        VotingDetailPage.argId: model.id
                      });
                    }else if(model.typeMenu == "arisan") {
                      Get.toNamed(Routes.arisanDetail, arguments: {
                        ArisanDetailPage.argId: model.id,
                        ArisanDetailPage.argPeriodeFromHistory: model.message,
                      });
                    }else if(model.typeMenu == "issue") {
                      Get.toNamed(Routes.issueDetail, arguments: {
                        IssueDetailPage.argId: model.id
                      });
                    }
                  },
                ))
        ]));
  }
}
