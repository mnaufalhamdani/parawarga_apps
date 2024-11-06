// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/profile/profile_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../theme/app_theme.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContentTop(context),
          _buildContentMainMenu(context),
          _buildContentSecondMenu(context),
        ],
      )),
    );
  }

  _buildContentTop(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: basePadding, right: basePadding, top: 50),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(basePadding)),
              color: colorLight.withOpacity(0.5),
            ),
            child: Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Iconsax.home_2, color: colorDark)),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: baseRadiusForm, right: baseRadiusForm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Muhammad Naufal Hamdani",
                            style: TextStyle(
                                color: colorTextPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "mnaufalhamdani@gmail.com",
                            style: TextStyle(
                                color: colorTextSecondary, fontSize: 11),
                          ),
                        ],
                      ),
                    )),
          Expanded(
            flex: 1,
                  child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                              "https://static.promediateknologi.id/crop/17x28:718x775/0x0/webp/photo/p2/74/2024/03/11/b59a225de4a04af870907663ce0de271-2703384518.jpg"),
                        ),
                      )),
                )
              ]),
            )));
  }

  _buildContentMainMenu(BuildContext context) {
    return Padding(
        padding:
        EdgeInsets.only(left: basePadding, right: basePadding, top: basePadding),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(basePadding)),
              color: colorLight.withOpacity(0.5),
            ),
            child: Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Expanded(
                            flex: 1,
                            child: Icon(Iconsax.clipboard_text, color: colorDark)),
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
                              child: Icon(Iconsax.arrow_right_3, color: colorDark),
                            ))
                      ]),
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Expanded(
                            flex: 1,
                            child: Icon(Iconsax.profile_2user, color: colorDark)),
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
                              child: Icon(Iconsax.arrow_right_3, color: colorDark),
                            ))
                      ]),
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Expanded(
                            flex: 1,
                            child: Icon(Iconsax.building_3, color: colorDark)),
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
                              child: Icon(Iconsax.arrow_right_3, color: colorDark),
                            ))
                      ]),
                    ),
                  ),
                ],
              ),
            )));
  }

  _buildContentSecondMenu(BuildContext context) {
    return Padding(
        padding:
        EdgeInsets.only(left: basePadding, right: basePadding, top: basePadding),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(basePadding)),
              color: colorLight.withOpacity(0.5),
            ),
            child: Padding(
              padding: EdgeInsets.all(baseRadiusForm),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Expanded(
                            flex: 1,
                            child: Icon(Iconsax.info_circle, color: colorDark)),
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
                              child: Icon(Iconsax.arrow_right_3, color: colorDark),
                            ))
                      ]),
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Expanded(
                            flex: 1,
                            child: Icon(Iconsax.logout, color: colorDark)),
                        Expanded(
                            flex: 5,
                            child: Text(
                              labellogout,
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
                              child: Icon(Iconsax.arrow_right_3, color: colorDark),
                            ))
                      ]),
                    ),
                  ),
                ],
              ),
            )));
  }
}
