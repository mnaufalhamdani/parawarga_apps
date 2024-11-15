// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class VotingDetailTile extends StatefulWidget {
  final Map<String, dynamic> model;
  final void Function(Map<String, dynamic> model) onPressed;

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
              color: Colors.grey.shade50
            ),
            child: Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.model['label'],
                        style: TextStyle(
                            fontSize: 14, color: colorTextSecondary)),
                    SizedBox(height: baseRadiusForm),
                    Row(
                      children: [
                        Expanded(
                          flex: widget.model['percent'],
                          child: Container(
                            height: 3,
                            color: colorPrimary,
                          ),
                        ),
                        Expanded(
                          flex: (100 - widget.model['percent']).toInt(),
                          child: Container(
                            height: 2,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: Text(
                              "${widget.model['percent']}%",
                              style: TextStyle(
                                  fontSize: 14, color: colorTextSecondary),
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
