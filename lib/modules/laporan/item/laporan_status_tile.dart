// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class LaporanStatusTile extends StatefulWidget {
  final Map<String, dynamic> model;
  final void Function(Map<String, dynamic> model) onPressed;

  const LaporanStatusTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<LaporanStatusTile> createState() => LaporanStatusTileState();
}

class LaporanStatusTileState extends State<LaporanStatusTile> {
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
            "Waiting Approval",
            style: TextStyle(
                color: colorDark,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
      Text(
        "Proses menunggu Pengelola Area",
        style: TextStyle(
            color: colorTextSecondary,
            fontSize: 12),
      ),
      SizedBox(height: basePaddingInContent),
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          "30-12-2024 19:22",
          style: TextStyle(
              color: colorTextSecondary,
              fontSize: 12),
        ),
      ),
      Divider(color: Colors.grey.shade200)
    ]);
  }
}
