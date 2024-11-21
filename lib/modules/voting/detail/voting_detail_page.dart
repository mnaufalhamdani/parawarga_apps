// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/modules/voting/detail/voting_detail_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_theme.dart';
import '../item/voters_detail_tile.dart';
import '../item/voting_detail_tile.dart';

class VotingDetailPage extends GetView<VotingDetailController> {
  const VotingDetailPage({super.key});

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
                  left: basePadding,
                  right: basePadding,
                  bottom: baseRadiusForm),
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
                        child: Obx(() {
                          return _buildContentMainMenu(context);
                        }),
                      ))),
            )
          ],
        ),
      ),
    );
  }

  _buildContentMainMenu(BuildContext context) {
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
                        "RT.001 RW.003",
                        style: TextStyle(color: colorLight, fontSize: 12),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Liburan enaknya minggu berapa?",
                          style: TextStyle(
                              color: colorLight,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    SizedBox(height: basePaddingInContent),
                    _buildListVoting(context),
                  ]))),
          _buildSummaryVoters(context),
          _buildListVoters(context)
        ],
      ),
    );
  }

  _buildListVoting(BuildContext context) {
    return SizedBox(
      height: Get.height / 5,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: listVotes.length,
          itemBuilder: (context, index) {
            return VotingDetailTile(
              model: listVotes[index],
              onPressed: (model) async {
                controller.initLabelOfVoters.value = model["label"];
                controller.listData.value = listVotingDetail2;
              },
            );
          }),
    );
  }

  _buildSummaryVoters(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(basePaddingInContent),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
            onTap: () {
              controller.initLabelOfVoters.value = labelTotalMember;
              controller.listData.value = listVotingDetail;
            },
            child: Column(children: [
              Card(
                  color: colorLight,
                  child: Padding(
                      padding: EdgeInsets.all(basePaddingInContent),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(children: [
                            Text("20",
                                style: TextStyle(
                                    color: colorTextSecondary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                            Text("Warga",
                                style: TextStyle(
                                    color: colorTextSecondary, fontSize: 12))
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
              controller.initLabelOfVoters.value = labelNotVote;
              controller.listData.value = listVotingDetail2;
            },
            child: Column(children: [
              Card(
                  color: colorLight,
                  child: Padding(
                      padding: EdgeInsets.all(basePaddingInContent),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(children: [
                            Text("8",
                                style: TextStyle(
                                    color: colorTextSecondary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                            Text("Warga",
                                style: TextStyle(
                                    color: colorTextSecondary, fontSize: 12))
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
                  Text(controller.initLabelOfVoters.value,
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
                            itemCount: controller.listData.value.length,
                            itemBuilder: (context, index) {
                              return VotersDetailTile(
                                model: controller.listData.value[index],
                                onPressed: (model) async {},
                              );
                            })),
                  ),
                ]))));
  }
}
