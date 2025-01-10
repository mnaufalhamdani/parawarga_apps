// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/models/response/tagihan_detail_model.dart';
import 'package:parawarga_apps/models/response/tagihan_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/strings.dart';

class TagihanHistoryTile extends StatefulWidget {
  final History model;
  final int index;
  final int indexSelected;
  final void Function(History model, int index) onPressed;

  const TagihanHistoryTile({
    super.key,
    required this.model,
    required this.index,
    required this.indexSelected,
    required this.onPressed,
  });

  @override
  State<TagihanHistoryTile> createState() => TagihanHistoryTileState();
}

class TagihanHistoryTileState extends State<TagihanHistoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!widget.onPressed.isNull) {
            widget.onPressed(widget.model, widget.index);
          }
        },
        child: _buildContent());
  }

  _buildContent() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(baseRadiusCard)),
      color: (widget.index == widget.indexSelected) ? colorDark : colorLight,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(baseRadiusForm),
        child: Text(
          "Periode ${widget.model.periode}",
          style: TextStyle(color: (widget.index == widget.indexSelected) ? colorLight : colorDark, fontSize: 12),
        ))
    );
  }
}

class TagihanDetailTile extends StatefulWidget {
  final User model;
  final int userId;//user_id from login
  final void Function(User model) onPressed;

  const TagihanDetailTile({
    super.key,
    required this.model,
    required this.userId,
    required this.onPressed,
  });

  @override
  State<TagihanDetailTile> createState() => TagihanDetailTileState();
}

class TagihanDetailTileState extends State<TagihanDetailTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!widget.onPressed.isNull) {
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
                      color: (widget.userId == int.parse(widget.model.userId.toString())) ? colorDark : colorTextTitle,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Rp. ${currencyFormat(widget.model.nominal ?? "-")}",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: (widget.userId == int.parse(widget.model.userId.toString())) ? colorDark : colorTextMessage,
                    fontSize: 12,
                    fontWeight: (widget.userId == int.parse(widget.model.userId.toString())) ? FontWeight.bold : FontWeight.normal),
                ),
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
