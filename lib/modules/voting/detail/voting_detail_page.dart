// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(labelVotingDetail, style: TextStyle(color: colorPrimary)),
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
    final data = controller.votingState.value.data;
    if (controller.votingState.value.isLoading) {
      return Container();
    }

    if (data == null || controller.votingState.value.error != null) {
      return StandardErrorPage(
        message: controller.votingState.value.error?.message,
        paddingTop: 100,
        onPressed: () {
          controller.getVotingDetail();
        },
      );
    }

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
          _buildListVoters(context, data)
        ],
      ),
    );
  }

  _buildListVoting(BuildContext context, VotingDetailModel data) {
    return SizedBox(
      height: Get.height / 4,
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
                controller.votersClicked.value = int.parse(model.urutan.toString());
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
              controller.votersClicked.value = null;
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
              Text(labelMember,
                  style: TextStyle(
                      color: colorTextPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))
            ])),
        SizedBox(width: basePaddingInContent),
        Spacer(),
        SizedBox(width: basePaddingInContent),
        GestureDetector(
            onTap: () {
              controller.votersLabel.value = labelNotVote;
              controller.votersClicked.value = 0;
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
                            Text(labelMember,
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
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(baseRadiusForm),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://bithourproduction.com/blog/wp-content/uploads/2023/08/EmJaSRjUcAAPkTv.jpg"),
                        fit: BoxFit.cover))),
          ),
        ));
  }

  _buildListVoters(BuildContext context, VotingDetailModel data) {
    var votersList = List<Voter>.empty(growable: true);
    if(controller.votersClicked.value == null) {
      votersList.clear();
      votersList.addAll(controller.votingState.value.data!.voters);
    }else if(controller.votersClicked.value == 0) {
      votersList.clear();
      for (var element in data.voters) {
        if(element.urutan == null){
          votersList.add(element);
        }
      }
    }else if((controller.votersClicked.value ?? 0) >= 1) {
      votersList.clear();
      for (var element in data.voters) {
        if(element.urutan == controller.votersClicked.value.toString()){
          votersList.add(element);
        }
      }
    }

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
                  (votersList.isEmpty)
                      ? Expanded(child: StandardErrorPage(
                          message: msgNotFound,
                          onPressed: () {},
                        ))
                      : Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: baseRadiusForm),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.only(top: baseRadiusForm),
                                itemCount: votersList.length,
                                itemBuilder: (context, index) {
                                  return VotersDetailTile(
                                    model: votersList[index],
                                    onPressed: (model) async {},
                                  );
                                })),
                  )
                ]))));
  }
}
