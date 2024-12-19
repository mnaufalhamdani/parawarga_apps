// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/models/response/view_dashboard_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class DashboardIssueTile extends StatefulWidget {
  final Issue model;
  final void Function(Issue) onPressed;

  const DashboardIssueTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<DashboardIssueTile> createState() => DashboardIssueTileState();
}

class DashboardIssueTileState extends State<DashboardIssueTile> {
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
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(baseRadiusForm),
                        child: Image.network(height: 50, widget.model.attachment.toString(), fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Icon(Iconsax.gallery_slash, color: colorTextSecondary);
                            })
                    ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: baseRadiusForm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.title.toString(),
                            style: TextStyle(
                                color: colorTextSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            overflow: TextOverflow.clip,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: baseRadiusForm),
                            child: Text(
                              widget.model.areaName.toString(),
                              style: TextStyle(
                                  color: colorTextSecondary, fontSize: 12),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: basePadding),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(widget.model.updatedAt.toString(),
                                    style: TextStyle(
                                        color: colorTextSecondary,
                                        fontSize: 11),
                                ),
                              )),
                        ],
                      ),
                    )),
              ],
            )));
  }
}
