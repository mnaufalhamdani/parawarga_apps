// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/app_theme.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/utils/strings.dart';

class StandardAlertDialog {
  static void show(
    BuildContext context,
    String title,
    String? message,
    final void Function() onPressedYes
  ) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(baseRadius)),
        child: Padding(
          padding: const EdgeInsets.all(basePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                style: TextStyle(
                  color: colorTextTitle,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
              SizedBox(height: basePaddingInContent),
              Text(message ?? "",
                style: TextStyle(
                  color: colorTextMessage,
                  fontSize: 12)),
              SizedBox(height: basePaddingInContent),
              Row(children: [
                Expanded(child: Container()),
                StandardButtonPrimary(
                    titleHint: labelNo,
                    color: Colors.white,
                    buttonColor: Colors.red.shade700,
                    onPressed: (() {
                      Get.back();
                    })),
                SizedBox(width: basePaddingInContent),
                StandardButtonPrimary(
                    titleHint: labelYes,
                    color: colorLight,
                    buttonColor: colorPrimary,
                    onPressed: (() async {
                      onPressedYes();
                      Get.back();
                    }))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
