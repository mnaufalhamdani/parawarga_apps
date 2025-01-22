// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/my_area_unit_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_colors.dart';

class MyAreaTile extends StatefulWidget {
  final MyAreaUnitModel model;
  final void Function(MyAreaUnitModel model) onPressedManagement;
  final void Function(MyAreaUnitModel model) onPressedMyUnit;

  const MyAreaTile({
    super.key,
    required this.model,
    required this.onPressedManagement,
    required this.onPressedMyUnit,
  });

  @override
  State<MyAreaTile> createState() => MyAreaTileState();
}

class MyAreaTileState extends State<MyAreaTile> {
  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  _buildContent(BuildContext context) {
    final countryName = "${widget.model.kelurahanName}, ${widget.model.kecamatanName}, ${widget.model.kabupatenName}, ${widget.model.provinsiName}";
    final rtRw = "RT. ${widget.model.rt ?? msgUnknown} / RW. ${widget.model.rw ?? msgUnknown}";

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
                    Text(widget.model.areaName.toString(),
                      style: TextStyle(
                        color: colorLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                    Text(
                      rtRw,
                      style: TextStyle(color: colorLight, fontSize: 12),
                    ),
                    Text(
                      countryName,
                      style: TextStyle(color: colorLight, fontSize: 12),
                    ),
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
                        flex: 3,
                        child: Text(
                          "$labelTotal $labelCitizen",
                          style: TextStyle(
                              color: colorTextMessage, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorTextMessage, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.model.totalUser ?? "0",
                            style: TextStyle(
                                color: colorTextMessage,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container())
                    ]),
                    Row(children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "$labelTotal $labelUnit",
                          style: TextStyle(
                              color: colorTextMessage, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: colorTextMessage, fontSize: 11),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.model.totalUnit ?? "0",
                            style: TextStyle(
                                color: colorTextMessage,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(flex: 1, child: Container())
                    ]),
                    GestureDetector(
                      onTap: () {
                        widget.onPressedManagement(widget.model);
                      },
                      child: Row(children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "$labelTotal $labelAdminCitizen",
                            style: TextStyle(
                                color: colorTextMessage, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            ":",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: colorTextMessage, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(
                            "${widget.model.detail.length}",
                            style: TextStyle(
                                color: colorTextMessage,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(flex: 1, child: Icon(Icons.info_outline_rounded, color: colorTextMessage, size: baseRadius))
                      ]),
                    ),
                    SizedBox(height: basePaddingInContent / 2),
                    GestureDetector(
                      onTap: () {
                        widget.onPressedMyUnit(widget.model);
                      },
                      child: Row(children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "$labelTotal $labelUnit $labelMy",
                            style: TextStyle(
                                color: colorTextMessage, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            ":",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: colorTextMessage, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(
                            "${widget.model.unit.length}",
                            style: TextStyle(
                                color: colorTextMessage,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(flex: 1, child: Icon(Icons.info_outline_rounded, color: colorTextMessage, size: baseRadius))
                      ]),
                    ),
                    SizedBox(height: basePaddingInContent / 2),
                  ]))
        ]));
  }
}

class ManagementTile extends StatefulWidget {
  final Detail model;
  final bool isLast;

  const ManagementTile({
    super.key,
    required this.model,
    required this.isLast,
  });

  @override
  State<ManagementTile> createState() => ManagementTileState();
}

class ManagementTileState extends State<ManagementTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: basePadding, right: basePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.model.name.toString(),
            style: TextStyle(color: colorTextMessage, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.model.phone.toString(),
            style: TextStyle(color: colorTextMessage, fontSize: 12),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.model.positionName.toString(),
              style: TextStyle(color: colorTextMessage, fontSize: 12),
            ),
          ),
          Visibility(visible: !widget.isLast, child: Divider(color: Colors.grey.shade200,))
        ]
    ));
  }
}

class MyUnitTile extends StatefulWidget {
  final Unit model;
  final bool isLast;
  final void Function(Unit model) onPressed;

  const MyUnitTile({
    super.key,
    required this.model,
    required this.isLast,
    required this.onPressed,
  });

  @override
  State<MyUnitTile> createState() => MyUnitTileState();
}

class MyUnitTileState extends State<MyUnitTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed(widget.model);
      },
      child: Padding(padding: EdgeInsets.only(left: basePadding, right: basePadding),
          child: SizedBox(
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model.name.toString(),
                              style: TextStyle(color: colorTextMessage, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Catatan: ${widget.model.additionalDesc ?? "-"}",
                              style: TextStyle(color: colorTextMessage, fontSize: 12),
                            ),
                            Row(children: [
                              Visibility(
                                  visible: widget.model.isEmpty == true,
                                  child: Container(margin: EdgeInsets.only(top: basePaddingInContent / 2), decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(baseRadiusCard),
                                      color: colorPrimary),
                                    child: Padding(
                                      padding: EdgeInsets.all(basePaddingInContent / 2),
                                      child: Text(
                                        labelUnitEmpty,
                                        style: TextStyle(color: colorLight, fontSize: 12),
                                      ),
                                    ),
                                  )
                              ),
                              Visibility(visible: widget.model.isEmpty == true, child: SizedBox(width: basePaddingInContent / 2)),
                              Visibility(
                                  visible: widget.model.contract == true,
                                  child: Container(margin: EdgeInsets.only(top: basePaddingInContent / 2), decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(baseRadiusCard),
                                      color: colorLight),
                                    child: Padding(
                                      padding: EdgeInsets.all(basePaddingInContent / 2),
                                      child: Text(
                                        labelTitleContract,
                                        style: TextStyle(color: colorPrimary, fontSize: 12),
                                      ),
                                    ),
                                  )
                              )
                            ])
                          ]
                      ),
                    ),
                  ],
                ),

                Visibility(visible: !widget.isLast, child: Divider(color: Colors.grey.shade200,))
              ],
            ),
          )),
    );
  }
}
