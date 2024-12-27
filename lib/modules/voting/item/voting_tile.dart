// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/app_theme.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../models/response/voting_model.dart';
import '../../../theme/app_colors.dart';

class VotingTile extends StatefulWidget {
  final VotingModel model;
  final void Function(VotingModel model, String value) onPressed;
  final void Function(VotingModel model) onDetail;

  const VotingTile({
    super.key,
    required this.model,
    required this.onPressed,
    required this.onDetail,
  });

  @override
  State<VotingTile> createState() => VotingTileState();
}

class VotingTileState extends State<VotingTile> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () {
        },
        child: (widget.model.urutan != null && widget.model.history.isNotEmpty)
            ? _buildContentVoted()
            : _buildContentVoting());
  }

  _buildContentVoted() {
    var totalVoters = 0;
    if(widget.model.history.isNotEmpty){
      for (var element in widget.model.history) {
        totalVoters += int.parse(element.totalVote ?? "0");
      }
    }

    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(baseRadiusCard)),
        color: Colors.white,
        elevation: 2,
        child: Column(children: [
          Container(
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(baseRadiusCard),
                      topRight: Radius.circular(baseRadiusCard)),
                  color: colorPrimary),
              child: Padding(
                  padding: EdgeInsets.all(baseRadiusCard),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.areaName.toString(),
                          style: TextStyle(color: colorLight, fontSize: 12),
                        ),
                        Text(widget.model.name.toString(),
                            style: TextStyle(
                                color: colorLight,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ]))),
          Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < widget.model.history.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                          left: basePadding,
                          top: baseRadiusForm,
                          right: basePadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.model.history[i].answer.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: colorTextSecondary)),
                            SizedBox(height: baseRadiusForm),
                            Row(
                              children: [
                                Expanded(
                                  flex: int.parse(widget.model.history[i].votePercent.toString()),
                                  child: Container(
                                    height: 3,
                                    color: colorPrimary,
                                  ),
                                ),
                                Expanded(
                                  flex: (100 - int.parse(widget.model.history[i].votePercent.toString()))
                                      .toInt(),
                                  child: Container(
                                    height: 2,
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                Expanded(
                                  flex: 20,
                                  child: Text(
                                      "${widget.model.history[i].votePercent}%",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: colorTextSecondary),
                                      textAlign: TextAlign.right),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: basePadding, bottom: baseRadiusForm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Vote: $totalVoters pemilih \nKadaluarsa: ${widget.model.updatedAt}",
                            style: TextStyle(
                                color: colorTextSecondary, fontSize: 11)),
                        GestureDetector(
                            onTap: () {
                              widget.onDetail(widget.model);
                            },
                            child: SizedBox(
                                width: 35,
                                height: 35,
                                child: Icon(Iconsax.info_circle,
                                    color: colorPrimary)))
                      ],
                    ),
                  )
                ],
              ))
        ]));
  }

  _buildContentVoting() {
    var onValue = "";
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(baseRadiusCard)),
        color: Colors.white,
        elevation: 2,
        child: Column(children: [
          Container(
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(baseRadiusCard),
                      topRight: Radius.circular(baseRadiusCard)),
                  color: colorPrimary),
              child: Padding(
                  padding: EdgeInsets.all(baseRadiusCard),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.areaName.toString(),
                          style: TextStyle(color: colorLight, fontSize: 12),
                        ),
                        Text(widget.model.name.toString(),
                            style: TextStyle(
                                color: colorLight,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ]))),
          Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < widget.model.detail.length; i++)
                    RadioListTile(
                        title: Text(widget.model.detail[i].answer.toString(),
                            style: TextStyle(
                                fontSize: 14, color: colorTextSecondary)),
                        value: widget.model.detail[i].urutan,
                        groupValue: onValue,
                        visualDensity: VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                        contentPadding: EdgeInsets.zero,
                        onChanged: (value) {
                          setState(() {
                            onValue = value.toString();
                          });
                        }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kadaluarsa: ${widget.model.updatedAt.toString()}",
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 11)),
                      StandardButtonPrimary(
                        titleHint: labelSubmit,
                        onPressed: (){
                          widget.onPressed(widget.model, onValue);
                        },
                      ),
                    ],
                  )
                ],
              ))
        ]));
  }
}
