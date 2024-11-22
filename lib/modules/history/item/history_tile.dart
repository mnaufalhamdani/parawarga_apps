// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/core/extension.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class HistoryTile extends StatefulWidget {
  final Map<String, dynamic> model;
  final void Function(Map<String, dynamic> model) onPressed;

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
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(baseRadiusCard)),
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.all(baseRadiusForm),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: colorLight,
                          child: SizedBox(
                            height: 35,
                            child: Builder(
                              builder: (context) {
                                if (widget.model["category"] == "arisan") {
                                  return Icon(Iconsax.convert_3d_cube, color: colorDark);
                                } else if (widget.model["category"] == "tagihan") {
                                  return Icon(Iconsax.card, color: colorDark);
                                } else if (widget.model["category"] == "laporan") {
                                  return Icon(Iconsax.message_text, color: colorDark);
                                } else if (widget.model["category"] == "alarm") {
                                  return Icon(Iconsax.alarm, color: colorDark);
                                } else {
                                  return Icon(Iconsax.slash, color: colorDark);
                                }
                              }
                            ),
                          )
                      ),
                      Text(widget.model["category"].toString().toTitleCase(),
                          style: TextStyle(
                              color: colorTextPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ],
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(left: baseRadiusForm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model["name"],
                            style: TextStyle(
                                color: colorTextSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            overflow: TextOverflow.clip,
                          ),
                          Text(
                            widget.model["area"],
                            style: TextStyle(
                                color: colorTextSecondary, fontSize: 12),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: basePaddingInContent),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(widget.model["created"],
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
