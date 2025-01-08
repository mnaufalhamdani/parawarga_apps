// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/response/ArisanModel.dart';
import 'package:parawarga_apps/theme/app_theme.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_colors.dart';

class ArisanTile extends StatefulWidget {
  final ArisanModel model;
  final void Function(ArisanModel model) onPressed;

  const ArisanTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<ArisanTile> createState() => ArisanTileState();
}

class ArisanTileState extends State<ArisanTile> {
  @override
  Widget build(BuildContext context) {

    return badges.Badge(
      showBadge: widget.model.currentPeriode == widget.model.totalPeriode,
      position: badges.BadgePosition.topEnd(top: -5, end: -5),
      badgeContent: Icon(Icons.check, color: Colors.white, size: baseRadius / 1.5),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.instagram,
        badgeColor: colorDark,
      ),
      child: GestureDetector(
          onTap: () {
            if (!widget.onPressed.isNull) {
              widget.onPressed(widget.model);
            }
          },
          child: _buildContent(context)),
    );
  }

  _buildContent(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(baseRadiusCard)),
        color: Colors.white,
        child: Column(children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(baseRadiusCard),
                    topRight: Radius.circular(baseRadiusCard)),
                color: colorPrimary),
            child: Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Column(
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
            ),
          ),
          Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          labelPeriode,
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${
                                (widget.model.currentPeriode == widget.model.totalPeriode)
                                  ? widget.model.currentPeriode
                                  : int.parse(widget.model.currentPeriode.toString()) + 1
                            } / ${widget.model.totalPeriode}",
                            style: TextStyle(
                                color: colorTextSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          labelDate,
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.model.datePeriode.toString(),
                            style: TextStyle(
                                color: colorTextSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          labelSubsciption,
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          currencyFormat(widget.model.nominal.toString()),
                          style: TextStyle(
                              color: colorTextSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          labelTotal,
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            currencyFormat(widget.model.totalPayed.toString()),
                            style: TextStyle(
                                color: colorTextSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                  ]))
        ]));
  }
}
