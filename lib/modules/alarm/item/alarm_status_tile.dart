// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../models/response/alarm_detail_model.dart';
import '../../../theme/app_colors.dart';

class AlarmStatusTile extends StatefulWidget {
  final History model;
  final bool isFirst;
  final bool isLast;
  final void Function(History) onPressed;

  const AlarmStatusTile({
    super.key,
    required this.model,
    required this.isFirst,
    required this.isLast,
    required this.onPressed,
  });

  @override
  State<AlarmStatusTile> createState() => AlarmStatusTileState();
}

class AlarmStatusTileState extends State<AlarmStatusTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onPressed(widget.model);
        },
        child: _buildContent());
  }

  _buildContent() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: basePaddingInContent),
              child: SizedBox(
                width: 80,
                child: Text(
                  widget.model.updatedAt.toString(),
                  style: TextStyle(
                      color: colorTextlabel,
                      fontSize: 12),
                ),
              ),
            ),
          ),
          Stack(children: [
            Padding(
              padding:EdgeInsets.only(left: basePaddingInContent / 3, right: basePaddingInContent / 3),
              child: Container(
                width: basePaddingInContent / 5,
                decoration: BoxDecoration(
                  color: colorTextlabel,
                  borderRadius: BorderRadius.circular(basePaddingInContent)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: basePaddingInContent),
              child: Container(
                width: baseRadiusCard,
                height: baseRadiusCard,
                decoration: BoxDecoration(
                  color: (widget.isFirst) ? colorPrimary : colorTextMessage,
                  borderRadius: BorderRadius.circular(baseRadiusCard)
                )
              ),
            ),
          ]),
          SizedBox(width: 10),
          Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(top: basePaddingInContent / 2),
                child: Text(
                  widget.model.statusName.toString(),
                  style: TextStyle(
                      color: colorTextTitle,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Text(
                widget.model.message ?? "",
                style: TextStyle(
                    color: colorTextMessage,
                    fontSize: 12),
              ),
              SizedBox(height: basePaddingInContent * 2)
            ]),
          ),
        ],
      )
    );
  }
}
