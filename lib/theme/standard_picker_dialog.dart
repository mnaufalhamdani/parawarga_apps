// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/app_theme.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../core/constants.dart';

class StandardPickerDialog {
  static void show(BuildContext context, final void Function(String path) onCaptured) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(baseRadius)),
        child: Padding(
          padding: const EdgeInsets.all(basePadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      pickerPhoto(ImageSource.camera, (path) {
                        onCaptured(path);
                        Get.back();
                      });
                    },
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.all(baseRadiusForm),
                        child: Icon(Iconsax.camera, size: 50, color: colorDark)),
                      Text(labelCamera,
                        style: TextStyle(
                          color: colorDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 12))
                    ])),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      pickerPhoto(ImageSource.gallery, (path) {
                        onCaptured(path);
                        Get.back();
                      });
                    },
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.all(baseRadiusForm),
                        child: Icon(Iconsax.gallery, size: 50, color: colorDark)),
                      Text(labelGallery,
                        style: TextStyle(
                          color: colorDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 12))
                      ])),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
