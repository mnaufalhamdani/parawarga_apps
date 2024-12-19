// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/view_dashboard_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class DashboardInfoTile extends StatefulWidget {
  final Information model;
  final void Function(Information) onPressed;

  const DashboardInfoTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<DashboardInfoTile> createState() => DashboardInfoTileState();
}

class DashboardInfoTileState extends State<DashboardInfoTile> {
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
    return SizedBox(
        width: 300,
        child: Card(
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
                    Text(widget.model.title.toString(),
                        style: TextStyle(
                            color: colorTextSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: baseRadiusForm),
                      child: Text(
                        widget.model.areaName.toString(),
                        style: TextStyle(color: colorTextSecondary, fontSize: 12),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(top: basePadding),
                            child: Text(widget.model.updatedAt.toString(),
                                style: TextStyle(
                                    color: colorTextSecondary, fontSize: 10)))
                    ),
                  ],
                ))));
  }
}
