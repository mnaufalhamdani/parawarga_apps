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
                  left: basePadding, right: basePadding, bottom: baseRadiusForm),
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
                        topLeft: Radius.circular(basePadding),
                        topRight: Radius.circular(basePadding),
                      ),
                      color: colorPrimary),
                  child: Padding(
                      padding: EdgeInsets.only(top: baseRadiusForm),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
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
    return Obx(() => Padding(
        padding: EdgeInsets.only(
            left: basePadding, top: basePadding, right: basePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "RT.001 RW.003",
              style: TextStyle(color: colorTextSecondary, fontSize: 12),
            ),
            Text("Liburan enaknya minggu berapa?",
                style: TextStyle(
                    color: colorTextSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            _buildListVoting(context),
            _buildSummaryVoters(context),
            Divider(color: Colors.grey.shade200),
            Padding(
              padding: EdgeInsets.only(top: basePadding),
              child: Text(controller.initLabelOfVoters.value,
                  style: TextStyle(
                      color: colorPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            _buildListVoters(context)
          ],
        ),
      ),
    );
  }

  _buildListVoting(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 5,
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
          }
      ),
    );
  }

  _buildSummaryVoters(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: GestureDetector(
                onTap: () {
                  controller.initLabelOfVoters.value = labelTotalMember;
                  controller.listData.value = listVotingDetail;
                },
                child: Card(
                  color: Colors.blue.shade100,
                  child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Column(
                        children: [
                          Text("20 Warga",
                              style: TextStyle(
                                  color: colorTextSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          Text(labelTotalMember,
                              style: TextStyle(
                                  color: colorTextSecondary,
                                  fontSize: 11))
                        ],
                      )),
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: GestureDetector(
                onTap: () {
                  controller.initLabelOfVoters.value = labelNotVote;
                  controller.listData.value = listVotingDetail2;
                },
                child: Card(
                  color: Colors.red.shade100,
                  child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Column(
                        children: [
                          Text("8 Warga",
                              style: TextStyle(
                                  color: colorTextSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          Text(labelNotVote,
                              style: TextStyle(
                                  color: colorTextSecondary,
                                  fontSize: 11))
                        ],
                      )),
                ),
              ),
            )),
      ],
    );
  }

  _buildListVoters(BuildContext context) {
    return Expanded(
      child: Padding(padding: EdgeInsets.only(top: baseRadiusForm),
        child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: baseRadiusForm),
            itemCount: controller.listData.value.length,
            itemBuilder: (context, index) {
              return VotersDetailTile(
                model: controller.listData.value[index],
                onPressed: (model) async {
                },
              );
            }
        )),
    );
  }
}
