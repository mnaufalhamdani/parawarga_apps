// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/strings.dart';

class TagihanTile extends StatefulWidget {
  final Map<String, dynamic> model;
  final void Function(Map<String, dynamic> model) onPressed;

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
                              "RT.001 RW.003",
                              style: TextStyle(color: colorLight, fontSize: 12),
                            ),
                            Text(widget.model["name"],
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
                              widget.model["note"],
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
                              widget.model["expired"].toString(),
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
                          "Rp. ${widget.model["nominal"]}",
                          style: TextStyle(color: colorTextSecondary, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Expanded(flex: 1, child: SizedBox()),
                        Container(decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(baseRadiusCard),
                            color: (widget.model["isRequired"] == true) ? colorDark : colorLight),
                          child: Padding(
                            padding: EdgeInsets.all(basePaddingInContent / 2),
                            child: Text(
                              (widget.model["isRequired"] == true) ? labelRequired : labelNotRequired,
                              style: TextStyle(color: (widget.model["isRequired"] == true) ? colorLight : colorDark, fontSize: 12),
                            ),
                          ),
                        )
                      ])
                    ],
                  ))
            ])));
  }
}
