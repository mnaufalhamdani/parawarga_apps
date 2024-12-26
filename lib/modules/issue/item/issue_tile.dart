// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/models/response/issue_model.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class IssueTile extends StatefulWidget {
  final IssueModel model;
  final void Function(IssueModel) onPressed;

  const IssueTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<IssueTile> createState() => IssueTileState();
}

class IssueTileState extends State<IssueTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!widget.onPressed.isNull) {
            widget.onPressed(widget.model);
          }
        },
        child: _buildContent());
  }

  _buildContent() {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(baseRadiusCard)),
        color: Colors.white,
        elevation: 2,
        child: Padding(
            padding: EdgeInsets.all(baseRadiusForm),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(baseRadiusForm),
                        child: Image.network(height: 50, widget.model.attachment.toString(), fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Icon(Iconsax.gallery_slash, color: colorTextTitle);
                            })
                    ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: baseRadiusForm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.title.toString(),
                            style: TextStyle(
                                color: colorTextTitle,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            overflow: TextOverflow.clip,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: baseRadiusForm),
                            child: Text(
                              widget.model.areaName.toString(),
                              style: TextStyle(
                                  color: colorTextMessage, fontSize: 12),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: basePadding),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(widget.model.updatedAt.toString(),
                                    style: TextStyle(
                                        color: colorTextlabel,
                                        fontSize: 11),
                                ),
                              )),
                        ],
                      ),
                    )),
              ],
            )));
  }
}
