// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class InfoTile extends StatefulWidget {
  final Map<String, dynamic> model;
  final void Function(Map<String, dynamic> model) onPressed;

  const InfoTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<InfoTile> createState() => InfoTileState();
}

class InfoTileState extends State<InfoTile> {
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
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(baseRadiusCard)),
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(baseRadiusForm),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.model["label"],
                style: TextStyle(
                    color: colorTextSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)
            ),
            Padding(
              padding: EdgeInsets.only(top: baseRadiusForm),
              child: Text(
                "RT.001 RW.003",
                style: TextStyle(color: colorTextSecondary, fontSize: 12),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(top: basePadding),
                    child: Text(widget.model["date"],
                        style: TextStyle(
                            color: colorTextSecondary, fontSize: 10)))
            ),
          ],
        )));
  }
}
