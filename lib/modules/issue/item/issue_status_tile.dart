// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/issue_detail_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class IssueStatusTile extends StatefulWidget {
  final History model;
  final void Function(History) onPressed;

  const IssueStatusTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<IssueStatusTile> createState() => IssueStatusTileState();
}

class IssueStatusTileState extends State<IssueStatusTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!widget.onPressed.isNull) {
            widget.onPressed(widget.model);
          }
        },
        child: _buildContent());
  }

  _buildContent() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(baseRadiusCard),
          color: colorLight
        ),
        child: Padding(
          padding: EdgeInsets.all(basePaddingInContent / 2),
          child: Text(
            widget.model.statusName.toString(),
            style: TextStyle(
                color: colorDark,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
      Text(
        widget.model.message ?? "-",
        style: TextStyle(
            color: colorTextSecondary,
            fontSize: 12),
      ),
      SizedBox(height: basePaddingInContent),
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          widget.model.updatedAt.toString(),
          style: TextStyle(
              color: colorTextSecondary,
              fontSize: 12),
        ),
      ),
      Divider(color: Colors.grey.shade200)
    ]);
  }
}
