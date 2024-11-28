// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/theme/app_theme.dart';

import '../../../theme/app_colors.dart';

class LaporanInputFileTile extends StatefulWidget {
  final Map<String, dynamic> model;
  final void Function(Map<String, dynamic> model) onPressed;

  const LaporanInputFileTile({
    super.key,
    required this.model,
    required this.onPressed,
  });

  @override
  State<LaporanInputFileTile> createState() => LaporanInputFileTileState();
}

class LaporanInputFileTileState extends State<LaporanInputFileTile> {
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
    return Row(
      children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(baseRadiusCard)),
            color: Colors.white,
            elevation: 2,
            child: Padding(
                padding: EdgeInsets.all(baseRadiusForm),
                child: Container(width: Get.width - (Get.width / 3), height: Get.width - (Get.width / 1.5), color: Colors.grey,))),
        SizedBox(width: basePaddingInContent),
        Column(children: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: colorLight,
              child: SizedBox(
                width: 35,
                child: Icon(Iconsax.edit, color: colorDark),
              ),
            ),
          ),
          SizedBox(height: Get.width - (Get.width / 1.1)),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.red.shade100,
              child: SizedBox(
                width: 35,
                child: Icon(Iconsax.trash, color: Colors.red.shade700),
              ),
            ),
          )
        ])
      ],
    );
  }
}
