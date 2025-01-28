// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/response/arisan_detail_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../theme/app_colors.dart';

class ArisanDetailTile extends StatefulWidget {
  final Detail model;
  final int userId;//user_id from login
  final void Function(Detail model) onPressed;

  const ArisanDetailTile({
    super.key,
    required this.model,
    required this.userId,
    required this.onPressed,
  });

  @override
  State<ArisanDetailTile> createState() => ArisanDetailTileState();
}

class ArisanDetailTileState extends State<ArisanDetailTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onPressed(widget.model);
        },
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.model.createdName.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: (widget.userId == int.parse(widget.model.userId.toString())) ? colorPrimary : colorTextMessage,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.model.unitName ?? labelUnitNotFound,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: (widget.userId == int.parse(widget.model.userId.toString())) ? colorPrimary : colorTextMessage,
                    fontSize: 12,
                    fontWeight: (widget.userId == int.parse(widget.model.userId.toString())) ? FontWeight.bold : FontWeight.normal)),
            ),
            Visibility(visible: (widget.model.winDate != null) ? true : false, child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.model.winDate.toString(),
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: colorTextlabel,
                    fontSize: 12),
              ),
            )),
            Divider(color: Colors.grey.shade200),
          ]
        )
    );
  }
}

class ArisanHistoryTile extends StatefulWidget {
  final User model;
  final int userId;//user_id from login
  final void Function(User model) onPressed;

  const ArisanHistoryTile({
    super.key,
    required this.model,
    required this.userId,
    required this.onPressed,
  });

  @override
  State<ArisanHistoryTile> createState() => ArisanHistoryTileState();
}

class ArisanHistoryTileState extends State<ArisanHistoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.onPressed != null) {
            widget.onPressed(widget.model);
          }
        },
        child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.model.createdName.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: (widget.userId == int.parse(widget.model.userId.toString())) ? colorPrimary : colorTextMessage,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rp. ${currencyFormat(widget.model.nominal ?? "-")}",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: (widget.userId == int.parse(widget.model.userId.toString())) ? colorPrimary : colorTextMessage,
                    fontSize: 12,
                    fontWeight: (widget.userId == int.parse(widget.model.userId.toString())) ? FontWeight.bold : FontWeight.normal)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.model.updatedAt.toString(),
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: colorTextlabel,
                      fontSize: 12),
                ),
              ),
              Divider(color: Colors.grey.shade200),
            ]
        )
    );
  }
}

class FilterHistoryTile extends StatelessWidget {
  final History model;
  final int index;
  final void Function(History model, int index) onPressed;

  const FilterHistoryTile({
    super.key,
    required this.model,
    required this.index,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: basePadding, right: basePadding),
        child: SizedBox(
            width: Get.width,
            child: TextButton(
              onPressed: (){
                onPressed(model, index);
              },
              child: Text("Periode ${model.periodeName}",
                  overflow: TextOverflow.clip,
                  style: TextStyle(color: colorPrimary)),
            )
        )
    );
  }
}