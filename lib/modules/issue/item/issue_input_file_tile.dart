// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/models/domain/issue_domain.dart';
import 'package:parawarga_apps/theme/app_theme.dart';
import 'package:parawarga_apps/theme/standard_picker_field.dart';
import 'package:widget_zoom/widget_zoom.dart';

import '../../../theme/app_colors.dart';

class IssueInputFileTile extends StatefulWidget {
  final InputIssueAttachmentDomain model;
  final int index;
  final void Function(InputIssueAttachmentDomain model, int index) onPressed;
  final void Function(InputIssueAttachmentDomain model, int index) onRemove;

  const IssueInputFileTile({
    super.key,
    required this.model,
    required this.index,
    required this.onPressed,
    required this.onRemove,
  });

  @override
  State<IssueInputFileTile> createState() => IssueInputFileTileState();
}

class IssueInputFileTileState extends State<IssueInputFileTile> {
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  /// if you take the widget from the [StandardPickerField] it won't take realtime Obx data
  _buildContent() {
    final fileName = widget.model.attachment.toString().split('/').last;
    return Padding(
      padding: EdgeInsets.only(left: basePaddingInContent, right: basePaddingInContent, top: basePaddingInContent),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(basePaddingInContent))
        ),
        child: Column(children: [
          Row(children: [
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: basePaddingInContent, right: basePaddingInContent),
                  child: Text(fileName, style: TextStyle(color: colorTextTitle, fontSize: 12, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,)
              ),
            ),
            IconButton(
                icon: Icon(Iconsax.edit, color: colorSecondary, size: baseRadius),
                onPressed: () {
                  widget.onPressed(widget.model, widget.index);
                }
            ),
            widget.onRemove.isNull
                ? Container()
                : IconButton(
                icon: Icon(Iconsax.trash, color: Colors.red.shade700, size: baseRadius),
                onPressed: () {
                  setState(() {
                    if(!widget.onRemove.isNull){
                      widget.onRemove(widget.model, widget.index);
                    }
                  });
                }
            )
          ]),
          _loadFileFoto()
        ]),
      ),
    );
  }

  _loadFileFoto() {
    if(!widget.model.attachment.isNull) {
      if (widget.model.attachment.toString().contains("http")){
        return ClipRRect(
          borderRadius: BorderRadius.circular(baseRadiusCard),
          child: WidgetZoom(
            heroAnimationTag: "Zoom",
            zoomWidget: Image.network(widget.model.attachment.toString(), width: Get.width, height: 120, fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Icon(Iconsax.gallery_slash, color: colorTextTitle);
              }),
            )
        );
      }
      else{
        return ClipRRect(
          borderRadius: BorderRadius.circular(baseRadiusCard),
          child: WidgetZoom(
            heroAnimationTag: "Zoom",
            zoomWidget: Image.file(File(widget.model.attachment.toString()), width: Get.width, height: 120, fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Icon(Iconsax.gallery_slash, color: colorTextTitle);
              }),
            )
        );
      }
    }
    return Container(height: 120);
  }
}
