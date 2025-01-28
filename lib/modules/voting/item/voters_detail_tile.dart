// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:parawarga_apps/models/response/voting_detail_model.dart';

import '../../../theme/app_colors.dart';

class VotersDetailTile extends StatefulWidget {
  final Voter model;
  final void Function(Voter) onPressed;

  const VotersDetailTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<VotersDetailTile> createState() => VotersDetailTileState();
}

class VotersDetailTileState extends State<VotersDetailTile> {
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
                      color: colorTextMessage,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.model.answer ?? "-",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: colorTextMessage,
                    fontSize: 12),
              ),
            ),
            Divider(color: Colors.grey.shade200),
          ]
        )
    );
  }
}
