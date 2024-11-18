// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class ArisanDetailTile extends StatefulWidget {
  final Map<String, dynamic> model;
  final void Function(Map<String, dynamic> model) onPressed;

  const ArisanDetailTile({
    super.key,
    required this.model,
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
          if (!widget.onPressed.isNull) {
            widget.onPressed(widget.model);
          }
        },
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.model["name"],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: colorTextSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                (widget.model["payed"] != null) ? "Terbayar: ${widget.model["payed"]}" : widget.model["unit_name"],
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: colorTextSecondary,
                    fontSize: 12),
              ),
            ),
            Visibility(visible: (widget.model["date"] != null) ? true : false, child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tanggal menang: ${widget.model["date"]}",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: colorTextSecondary,
                    fontSize: 12),
              ),
            )),
            Divider(color: Colors.grey.shade200),
          ]
        )
    );
  }
}
