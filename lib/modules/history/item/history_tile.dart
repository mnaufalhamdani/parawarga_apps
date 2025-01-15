// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/core/extension.dart';
import 'package:parawarga_apps/models/response/history_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../core/constants.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/strings.dart';

class HistoryTile extends StatefulWidget {
  final HistoryModel model;
  final void Function(HistoryModel model) onPressed;

  const HistoryTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<HistoryTile> createState() => HistoryTileState();
}

class HistoryTileState extends State<HistoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!widget.onPressed.isNull) {
            widget.onPressed(widget.model);
          }
        },
        child: _buildContent(context));
  }

  _buildContent(BuildContext context) {
    var icon = Iconsax.volume_high;
    var label = labelNote;
    var note = "-";
    if (widget.model.typeMenu == "tagihan"){
      icon = Iconsax.card_pos;
      label = labelTotal;
      note = "Rp. ${currencyFormat(widget.model.message.toString())}";
    }else if (widget.model.typeMenu == "voting"){
      icon = Iconsax.like_dislike;
      label = labelVote;
      note = widget.model.message.toString();
    }else if (widget.model.typeMenu == "arisan"){
      icon = Iconsax.convert_3d_cube;
      label = labelPeriode;
      note = widget.model.message.toString();
    }else if (widget.model.typeMenu == "issue"){
      icon = Iconsax.volume_high;
      label = labelNote;
      note = widget.model.message ?? "-";
    }

    var statusColor = Colors.grey.shade100;
    if (widget.model.status == 1){
      statusColor = Colors.amber.shade100;
    }else if (widget.model.status == 2){
      statusColor = Colors.red.shade100;
    }else if (widget.model.status == 3){
      statusColor = Colors.green.shade100;
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
              child: Row(
                children: [
                  Column(children: [
                    CircleAvatar(
                    backgroundColor: colorLight,
                      child: ClipOval(
                        child: Icon(icon, size: baseRadius, color: colorPrimary)
                      )
                    ),
                    Text(widget.model.typeMenu.toString().toTitleCase(),
                      style: TextStyle(
                        color: colorLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                  ]),
                  SizedBox(width: basePaddingInContent),
                  Column(
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
                    ]),
                ],
              ))),
          Padding(
            padding: EdgeInsets.all(baseRadiusForm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      label,
                      style: TextStyle(
                          color: colorTextMessage, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      ":",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorTextMessage, fontSize: 11),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        note,
                        style: TextStyle(
                            color: colorTextTitle,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ]),
                SizedBox(height: basePaddingInContent),
                Row(children: [
                  Container(decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(baseRadiusCard),
                      color: statusColor),
                    child: Padding(
                      padding: EdgeInsets.all(basePaddingInContent / 2),
                      child: Text(
                        widget.model.statusName.toString(),
                        style: TextStyle(color: colorTextTitle, fontSize: 12),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Text(
                    widget.model.updatedAt.toString(),
                    style: TextStyle(color: colorTextlabel, fontSize: 12),
                  )
                ])
              ],
            ))
        ]));
  }
}
