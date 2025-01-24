// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../models/response/my_area_unit_model.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_theme.dart';
import '../../../../theme/standard_error_page.dart';
import '../../../../utils/strings.dart';

class MyAreaTile extends StatefulWidget {
  final MyAreaUnitModel model;
  final void Function(MyAreaUnitModel area) onCreate;
  final void Function(Unit unit, MyAreaUnitModel area) onPressed;

  const MyAreaTile({
    super.key,
    required this.model,
    required this.onCreate,
    required this.onPressed,
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
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.model.areaName.toString(),
                            style: TextStyle(
                              color: colorLight,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                          Text((widget.model.unit.isEmpty)
                              ? "Tidak menempati unit manapun"
                              : "${widget.model.unit.length} unit yang Anda tempati",
                            style: TextStyle(
                              color: colorLight,
                              fontSize: 12)),
                        ]),
                  ),
                  FloatingActionButton.small(
                    heroTag: widget.model.areaId,
                    shape: CircleBorder(),
                    backgroundColor: colorSecondary,
                    onPressed: () {
                      widget.onCreate(widget.model);
                    },
                    child: Icon(Iconsax.add, color: colorTextSecondary)
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(baseRadiusForm),
            child: (widget.model.unit.isNotEmpty)
            ? ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: widget.model.unit.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: (index == 0) ? basePaddingInContent : basePaddingInContent / 2,
                    left: basePaddingInContent,
                    right: basePaddingInContent,
                    bottom: (index == widget.model.unit.length - 1) ? basePaddingInContent : basePaddingInContent / 2),
                child: MyUnitTile(
                  model: widget.model.unit[index],
                  isLast: index == widget.model.unit.length - 1,
                  onPressed: (model) {
                    widget.onPressed(model, widget.model);
                  }
                ));
              })
            : StandardErrorPage(
                message: msgNotFound,
                onPressed: () {},
            ),
          ),
        ]));
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
      )
    );
  }
}