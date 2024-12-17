// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/modules/profile/profile_controller.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../theme/app_theme.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContentHeader(context),
            _buildContentTop(context),
            _buildContentMainMenu(context),
            _buildContentSecondMenu(context),
          ],
        );
      })),
    );
  }

  _buildContentHeader(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/background/img_background_header.png"),
                fit: BoxFit.cover)),
        child: Padding(
            padding: EdgeInsets.only(
                left: basePadding, right: basePadding, top: 50, bottom: 85),
            child: SizedBox(width: Get.width, height: 50)));
  }

  _buildContentTop(BuildContext context) {
    return Transform.translate(
        offset: Offset(0, -20),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(baseRadiusCard),
                  topRight: Radius.circular(baseRadiusCard)),
              color: colorPrimary,
            ),
            child: Padding(
                padding: EdgeInsets.only(top: baseRadiusCard),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(baseRadiusCard),
                          topRight: Radius.circular(baseRadiusCard)),
                      color: colorBackground,
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: basePadding,
                            right: basePadding,
                            top: basePadding),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(baseRadiusCard)),
                              color: colorLight,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Icon(Iconsax.arrow_left,
                                              color: colorDark)),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: baseRadiusForm,
                                              right: baseRadiusForm),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                controller.userState.value.data
                                                        ?.name
                                                        .toString() ??
                                                    "",
                                                style: TextStyle(
                                                    color: colorTextPrimary,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                controller.userState.value.data
                                                        ?.email
                                                        .toString() ??
                                                    "",
                                                style: TextStyle(
                                                    color: colorTextSecondary,
                                                    fontSize: 11),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: CircleAvatar(
                                            backgroundColor: colorDark,
                                            child: ClipOval(
                                              child: (controller.userState.value.data?.photo != null)
                                                  ? Image.network(
                                                  controller.userState.value.data!.photo.toString())
                                                  : Text(
                                                      getInitials(controller.userState.value.data?.name.toString() ?? ""),
                                                      style: TextStyle(
                                                          color: colorTextThird,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                            ),
                                          )),
                                    )
                                  ]),
                            )))))));
  }

  _buildContentMainMenu(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: basePadding, right: basePadding),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(baseRadiusCard)),
              color: colorLight,
            ),
            child: Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(Iconsax.clipboard_text,
                                    color: colorDark)),
                            Expanded(
                                flex: 5,
                                child: Text(
                                  labelAllMenu,
                                  style: TextStyle(
                                      color: colorTextPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Iconsax.arrow_right_3,
                                      color: colorDark),
                                ))
                          ]),
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(Iconsax.profile_2user,
                                    color: colorDark)),
                            Expanded(
                                flex: 5,
                                child: Text(
                                  labelAdminCitizen,
                                  style: TextStyle(
                                      color: colorTextPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Iconsax.arrow_right_3,
                                      color: colorDark),
                                ))
                          ]),
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child:
                                    Icon(Iconsax.building_3, color: colorDark)),
                            Expanded(
                                flex: 5,
                                child: Text(
                                  labelManageUnit,
                                  style: TextStyle(
                                      color: colorTextPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Iconsax.arrow_right_3,
                                      color: colorDark),
                                ))
                          ]),
                    ),
                  ),
                  Visibility(
                      visible: true,
                      child: Divider(color: Colors.grey.shade200)),
                  Visibility(
                    visible: true,
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(baseRadiusForm),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child:
                                      Icon(Iconsax.setting, color: colorDark)),
                              Expanded(
                                  flex: 5,
                                  child: Text(
                                    labelManageAdmin,
                                    style: TextStyle(
                                        color: colorTextPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Iconsax.arrow_right_3,
                                        color: colorDark),
                                  ))
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  _buildContentSecondMenu(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: basePadding, right: basePadding, top: basePadding),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(baseRadiusCard)),
              color: colorLight,
            ),
            child: Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(Iconsax.info_circle,
                                    color: colorDark)),
                            Expanded(
                                flex: 5,
                                child: Text(
                                  labelAbout,
                                  style: TextStyle(
                                      color: colorTextPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Iconsax.arrow_right_3,
                                      color: colorDark),
                                ))
                          ]),
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),
                  GestureDetector(
                    onTap: () async {
                      await controller.logout().whenComplete(() {
                        if (controller.logoutState.value.data == true) {
                          Get.offAllNamed(Routes.login);
                        } else {
                          showStandardSnackbar(context, TypeMessage.error,
                              message: controller
                                  .logoutState.value.error?.message
                                  .toString());
                        }
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(Iconsax.profile_delete,
                                    color: Colors.red.shade700)),
                            Expanded(
                                flex: 5,
                                child: Text(
                                  labellogout,
                                  style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Iconsax.logout,
                                      color: Colors.red.shade700),
                                ))
                          ]),
                    ),
                  ),
                ],
              ),
            )));
  }
}
