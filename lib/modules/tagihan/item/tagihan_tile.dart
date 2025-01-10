// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/response/tagihan_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/strings.dart';

class TagihanTile extends StatefulWidget {
  final TagihanModel model;
  final void Function(TagihanModel model) onPressed;

  const TagihanTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<TagihanTile> createState() => TagihanTileState();
}

class TagihanTileState extends State<TagihanTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!widget.onPressed.isNull) {
            widget.onPressed(widget.model);
          }
        },
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(baseRadiusCard)),
            color: Colors.white,
            elevation: 2,
            child: Column(children: [
              Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(baseRadiusCard),
                          topRight: Radius.circular(baseRadiusCard)),
                      color: colorPrimary),
                  child: Padding(
                      padding: EdgeInsets.all(baseRadiusCard),
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
                          ]))),
              Padding(
                  padding: EdgeInsets.all(baseRadiusForm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            labelNote,
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
                              widget.model.message ?? "-",
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
                            labelExpired,
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
                              widget.model.endPeriode.toString(),
                              style: TextStyle(
                                  color: colorTextSecondary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ]),
                      SizedBox(height: basePaddingInContent),
                      Row(children: [
                        Text(
                          "Rp. ${currencyFormat(widget.model.nominal.toString())}",
                          style: TextStyle(color: colorTextSecondary, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Expanded(flex: 1, child: SizedBox()),
                        Container(decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(baseRadiusCard),
                            color: (widget.model.required == true) ? colorDark : colorLight),
                          child: Padding(
                            padding: EdgeInsets.all(basePaddingInContent / 2),
                            child: Text(
                              (widget.model.required == true) ? labelRequired : labelNotRequired,
                              style: TextStyle(color: (widget.model.required == true) ? colorLight : colorDark, fontSize: 12),
                            ),
                          ),
                        )
                      ])
                    ],
                  ))
            ])));
  }
}
