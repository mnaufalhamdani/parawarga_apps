// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/theme/app_theme.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';

import '../../../theme/app_colors.dart';

class VotingTile extends StatefulWidget {
  final Map<String, dynamic> model;
  final void Function(Map<String, dynamic> model) onPressed;

  const VotingTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<VotingTile> createState() => VotingTileState();
}

class VotingTileState extends State<VotingTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!widget.onPressed.isNull) {
            widget.onPressed(widget.model);
          }
        },
        child: (widget.model["percentOfDetails"].length > 0)
            ? _buildContentVoted()
            : _buildContentVoting());
  }

  _buildContentVoted() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 2,
        child: Padding(
            padding: EdgeInsets.all(baseRadiusForm),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.model["label"],
                    style: TextStyle(
                        color: colorTextSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                for (int i = 0;
                    i < widget.model["percentOfDetails"].length;
                    i++)
                  Padding(
                    padding: EdgeInsets.only(
                        left: basePadding,
                        top: baseRadiusForm,
                        right: basePadding),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.model["percentOfDetails"][i]['label'],
                              style: TextStyle(
                                  fontSize: 14, color: colorTextSecondary)),
                          SizedBox(height: baseRadiusForm),
                          Row(
                            children: [
                              Expanded(
                                flex: widget.model["percentOfDetails"][i]['percent'],
                                child: Container(
                                  height: 3,
                                  color: colorPrimary,
                                ),
                              ),
                              Expanded(
                                flex: (100 - widget.model["percentOfDetails"][i]['percent']).toInt(),
                                child: Container(
                                  height: 2,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              Expanded(
                                flex: 20,
                                child: Text(
                                    "${widget.model["percentOfDetails"][i]['percent']}%",
                                    style: TextStyle(
                                        fontSize: 14, color: colorTextSecondary),
                                    textAlign: TextAlign.right),
                              ),
                            ],
                          ),
                        ]),
                  ),
                Padding(
                  padding:
                      EdgeInsets.only(top: basePadding, bottom: baseRadiusForm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Vote: 32 partisipan \nExpired: 30-12-2024",
                          style: TextStyle(
                              color: colorTextSecondary, fontSize: 11))
                    ],
                  ),
                )
              ],
            )));
  }

  _buildContentVoting() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 2,
        child: Padding(
            padding: EdgeInsets.all(baseRadiusForm),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.model["label"],
                    style: TextStyle(
                        color: colorTextSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                for (int i = 0; i < widget.model["details"].length; i++)
                  RadioListTile(
                      title: Text(widget.model["details"][i]['label'],
                          style: TextStyle(
                              fontSize: 14, color: colorTextSecondary)),
                      value: widget.model["details"][i]['value'],
                      groupValue: widget.model["value"],
                      visualDensity: VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      onChanged: (value) {
                        setState(() {
                          widget.model["value"] = value as int;
                        });
                      }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Vote: 32 partisipan \nExpired: 30-12-2024",
                        style:
                            TextStyle(color: colorTextSecondary, fontSize: 11)),
                    Visibility(
                        visible: (widget.model["percentOfDetails"].length == 0)
                            ? true
                            : false,
                        child: StandardButtonPrimary(
                          titleHint: "Submit",
                        )),
                  ],
                )
              ],
            )));
  }
}
