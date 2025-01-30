// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:parawarga_apps/models/response/view_dashboard_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class DashboardAlarmTile extends StatefulWidget {
  final Alarm model;
  final void Function(Alarm) onPressed;

  const DashboardAlarmTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<DashboardAlarmTile> createState() => DashboardAlarmTileState();
}

class DashboardAlarmTileState extends State<DashboardAlarmTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onPressed(widget.model);
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
                    Text(widget.model.generateLocation.toString(),
                        style: TextStyle(
                            color: colorTextTitle,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: baseRadiusForm),
                      child: Text(
                        widget.model.message ?? "-",
                        style: TextStyle(color: colorTextMessage, fontSize: 12),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(top: basePadding),
                            child: Text(widget.model.updatedAt.toString(),
                                style: TextStyle(
                                    color: colorTextlabel, fontSize: 10)))
                    ),
                  ],
                ))));
  }
}
