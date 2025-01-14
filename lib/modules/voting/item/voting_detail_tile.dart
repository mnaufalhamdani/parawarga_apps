// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/models/response/voting_detail_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class VotingDetailTile extends StatefulWidget {
  final Detail model;
  final void Function(Detail model) onPressed;

  const VotingDetailTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<VotingDetailTile> createState() => VotingDetailTileState();
}

class VotingDetailTileState extends State<VotingDetailTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!widget.onPressed.isNull) {
            widget.onPressed(widget.model);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
              top: baseRadiusForm),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(baseRadiusForm)),
              color: Colors.white
            ),
            child: Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.model.answer.toString(),
                        style: TextStyle(
                            fontSize: 14, color: colorTextMessage, fontWeight: FontWeight.bold)),
                    SizedBox(height: baseRadiusForm),
                    Row(
                      children: [
                        Expanded(
                          flex: int.parse(widget.model.votePercent.toString()),
                          child: Container(
                            height: 3,
                            color: colorPrimary,
                          ),
                        ),
                        Expanded(
                          flex: (100 - int.parse(widget.model.votePercent.toString())).toInt(),
                          child: Container(
                            height: 2,
                            color: colorTextlabel,
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: Text(
                              "${widget.model.votePercent}%",
                              style: TextStyle(
                                  fontSize: 14, color: colorTextMessage),
                              textAlign: TextAlign.right),
                        ),
                      ],
                    ),
                  ]),
            )
          ),
        )
    );
  }
}
