// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class DashboardLaporanTile extends StatefulWidget {
  final Map<String, dynamic> model;
  final void Function(Map<String, dynamic> model) onPressed;

  const DashboardLaporanTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<DashboardLaporanTile> createState() => DashboardLaporanTileState();
}

class DashboardLaporanTileState extends State<DashboardLaporanTile> {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 2,
        child: Padding(
            padding: EdgeInsets.all(baseRadiusForm),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(baseRadiusForm),
                            image: DecorationImage(
                                image: NetworkImage(widget.model["photo"]),
                                fit: BoxFit.cover)))),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: baseRadiusForm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model["label"],
                            style: TextStyle(
                                color: colorTextSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            overflow: TextOverflow.clip,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: baseRadiusForm),
                            child: Text(
                              widget.model["area"],
                              style: TextStyle(
                                  color: colorTextSecondary, fontSize: 12),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: basePadding),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(widget.model["date"],
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
