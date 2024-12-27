// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/response/voting_detail_model.dart';
import 'package:parawarga_apps/modules/voting/detail/voting_detail_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';
import '../../../theme/standard_error_page.dart';
import '../item/voters_detail_tile.dart';
import '../item/voting_detail_tile.dart';

class VotingDetailPage extends GetView<VotingDetailController> {
  const VotingDetailPage({super.key});

  static const argId = 'argId';

  @override
  Widget build(BuildContext context) {
    controller.getVotingDetail();
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
                    left: basePadding,
                    right: basePadding),
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Iconsax.arrow_left, color: colorPrimary)),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: basePadding),
                        child: Text(
                          labelVotingDetail,
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
    final data = controller.votingState.value.data;
    if (controller.votingState.value.isLoading) {
      return Container();
    }

    if (data == null || controller.votingState.value.error != null) {
      return StandardErrorPage(
        message: controller.votingState.value.error?.message,
        onPressed: () {
          controller.getVotingDetail();
        },
      );
    }

    log("_buildContentMainMenu:${controller.votingState.value.data?.voters}");

    return Padding(
      padding: EdgeInsets.only(
          left: basePadding, top: basePadding, right: basePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(baseRadiusCard)),
              color: colorPrimary,
              child: Padding(
                  padding: EdgeInsets.all(basePaddingInContent),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        data.areaName.toString(),
                        style: TextStyle(color: colorLight, fontSize: 12),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(data.name.toString(),
                          style: TextStyle(
                              color: colorLight,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    SizedBox(height: basePaddingInContent),
                    _buildListVoting(context, data),
                  ]))),
          _buildSummaryVoters(context, data),
          _buildListVoters(context)
        ],
      ),
    );
  }

  _buildListVoting(BuildContext context, VotingDetailModel data) {
    return SizedBox(
      height: Get.height / 5,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: data.detail.length,
          itemBuilder: (context, index) {
            return VotingDetailTile(
              model: data.detail[index],
              onPressed: (model) async {
                controller.votersLabel.value = model.answer.toString();

                controller.votersList.value.clear();
                for (var element in data.voters) {
                  if(element.urutan == model.urutan){
                    controller.votersList.value.add(element);
                  }
                }
              },
            );
          }),
    );
  }

  _buildSummaryVoters(BuildContext context, VotingDetailModel data) {
    return Padding(
      padding: EdgeInsets.all(basePaddingInContent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
            onTap: () {
              controller.votersLabel.value = labelTotalMember;

              controller.votersList.value.clear();
              for (var element in data.voters) {
                controller.votersList.value.add(element);
              }
            },
            child: Column(children: [
              Card(
                  color: colorSecondary,
                  child: Padding(
                      padding: EdgeInsets.all(basePaddingInContent),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(children: [
                            Text(data.voters.length.toString(),
                                style: TextStyle(
                                    color: colorDark,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                            Text(labelVoters,
                                style: TextStyle(
                                    color: colorDark, fontSize: 12))
                          ]),
                        ),
                      ))),
              Text(labelTotalMember,
                  style: TextStyle(
                      color: colorTextPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))
            ])),
        SizedBox(width: basePaddingInContent),
        Expanded(child: _buildContentAdv(context)),
        SizedBox(width: basePaddingInContent),
        GestureDetector(
            onTap: () {
              controller.votersLabel.value = labelNotVote;

              controller.votersList.value.clear();
              for (var element in data.voters) {
                if(element.urutan == null){
                  controller.votersList.value.add(element);
                }
              }
            },
            child: Column(children: [
              Card(
                  color: colorSecondary,
                  child: Padding(
                      padding: EdgeInsets.all(basePaddingInContent),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(children: [
                            Text(data.voters.where((element) => element.urutan == null).length.toString(),
                                style: TextStyle(
                                    color: colorDark,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                            Text(labelVoters,
                                style: TextStyle(
                                    color: colorDark, fontSize: 12))
                          ]),
                        ),
                      ))),
              Text(labelNotVote,
                  style: TextStyle(
                      color: colorTextPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))
            ])),
      ]),
    );
  }

  _buildContentAdv(BuildContext context) {
    return Visibility(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(baseRadiusCard)),
            color: Colors.white,
            elevation: 2,
            child: Container(
                height: Get.width / 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(baseRadiusForm),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://bithourproduction.com/blog/wp-content/uploads/2023/08/EmJaSRjUcAAPkTv.jpg"),
                        fit: BoxFit.cover))),
          ),
        ));
  }

  _buildListVoters(BuildContext context) {
    return Expanded(
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(baseRadiusCard)),
            color: Colors.white,
            elevation: 2,
            child: Padding(
                padding: EdgeInsets.all(basePaddingInContent),
                child: Column(children: [
                  Text(controller.votersLabel.value,
                      style: TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: baseRadiusForm),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(top: baseRadiusForm),
                            itemCount: controller.votersList.value.length,
                            itemBuilder: (context, index) {
                              return VotersDetailTile(
                                model: controller.votersList.value[index],
                                onPressed: (model) async {},
                              );
                            })),
                  ),
                ]))));
  }
}
