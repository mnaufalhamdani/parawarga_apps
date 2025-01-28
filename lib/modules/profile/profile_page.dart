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
import 'package:widget_zoom/widget_zoom.dart';

import '../../theme/app_theme.dart';
import '../../theme/standard_alert_dialog.dart';

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
            // _buildContentSecondMenu(context),
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
                                              color: colorTextTitle)),
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
                                              Text(controller.userState.value.data?.userEntity.name ?? "",
                                                style: TextStyle(
                                                    color: colorTextTitle,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                controller.userState.value.data?.userEntity.email ?? "",
                                                style: TextStyle(
                                                    color: colorTextMessage,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: CircleAvatar(
                                              backgroundColor: colorTextTitle,
                                              child: ClipOval(
                                                child: (controller.userState.value.data?.userEntity.photo != null)
                                                    ? WidgetZoom(
                                                        heroAnimationTag: "Zoom",
                                                        zoomWidget: Image.network(controller.userState.value.data!.userEntity.photo.toString(), width: 40, height: 40, fit: BoxFit.cover),
                                                    )
                                                    : Text(
                                                        getInitials(controller.userState.value.data?.userEntity.name.toString() ?? ""),
                                                        style: TextStyle(
                                                            color: colorTextThird,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 18),
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                      ),
                                              ),
                                            ),
                                          )),
                                    )
                                  ]),
                            )))))));
  }

  _buildContentMainMenu(BuildContext context) {
    final authMenu = controller.authMenuState.value.data;
    if(authMenu == null){
      return Container();
    }

    return Container(
      margin: EdgeInsets.only(left: basePadding, right: basePadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(baseRadiusCard)),
        color: colorLight,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(baseRadiusForm),
        itemCount: authMenu.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  if (authMenu[i].slug != labellogout.toLowerCase()){
                    try {
                      Get.toNamed(authMenu[i].link.toString());
                    }catch (e) {
                      showStandardSnackbar(context, TypeMessage.error, message: "Navigasi tidak ditemukan");
                    }

                  }else{
                    StandardAlertDialog.show(
                        context,
                        "Keluar",
                        "Apakah Anda yakin keluar dari akun ini?", () async {
                      await controller.logout().whenComplete(() {
                        if (controller.logoutState.value.data == true) {
                          Get.offAllNamed(Routes.login);
                        } else {
                          showStandardSnackbar(context, TypeMessage.error,
                              message: controller.logoutState.value.error?.message.toString());
                        }
                      });
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(baseRadiusForm),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(mapperIcon.entries.where((element) => element.key == authMenu[i].icon).first.value,
                                color: (authMenu[i].slug != labellogout.toLowerCase()) ? colorTextTitle : Colors.red.shade700)),
                        Expanded(
                            flex: 5,
                            child: Text(
                              authMenu[i].name.toString(),
                              style: TextStyle(
                                  color: (authMenu[i].slug != labellogout.toLowerCase()) ? colorTextTitle : Colors.red.shade700,
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
                                  color: (authMenu[i].slug != labellogout.toLowerCase()) ? colorTextTitle : Colors.red.shade700),
                            ))
                      ]),
                ),
              ),
              (i != (authMenu.length - 1))
                  ? Divider(color: Colors.grey.shade200)
                  : Container()
            ],
          );
        }
      )
      // Padding(
      //   padding: EdgeInsets.all(baseRadiusForm),
      //   child: Column(
      //     children: [
      //       GestureDetector(
      //         onTap: () {},
      //         child: Padding(
      //           padding: EdgeInsets.all(baseRadiusForm),
      //           child: Row(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Expanded(
      //                     flex: 1,
      //                     child: Icon(Iconsax.clipboard_text,
      //                         color: colorTextTitle)),
      //                 Expanded(
      //                     flex: 5,
      //                     child: Text(
      //                       labelAllMenu,
      //                       style: TextStyle(
      //                           color: colorTextTitle,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 12),
      //                       maxLines: 1,
      //                       overflow: TextOverflow.ellipsis,
      //                     )),
      //                 Expanded(
      //                     flex: 1,
      //                     child: Align(
      //                       alignment: Alignment.centerRight,
      //                       child: Icon(Iconsax.arrow_right_3,
      //                           color: colorTextTitle),
      //                     ))
      //               ]),
      //         ),
      //       ),
      //       Divider(color: Colors.grey.shade200),
      //       GestureDetector(
      //         onTap: () {},
      //         child: Padding(
      //           padding: EdgeInsets.all(baseRadiusForm),
      //           child: Row(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Expanded(
      //                     flex: 1,
      //                     child: Icon(Iconsax.profile_2user,
      //                         color: colorTextTitle)),
      //                 Expanded(
      //                     flex: 5,
      //                     child: Text(
      //                       labelAdminCitizen,
      //                       style: TextStyle(
      //                           color: colorTextTitle,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 12),
      //                       maxLines: 1,
      //                       overflow: TextOverflow.ellipsis,
      //                     )),
      //                 Expanded(
      //                     flex: 1,
      //                     child: Align(
      //                       alignment: Alignment.centerRight,
      //                       child: Icon(Iconsax.arrow_right_3,
      //                           color: colorTextTitle),
      //                     ))
      //               ]),
      //         ),
      //       ),
      //       Divider(color: Colors.grey.shade200),
      //       GestureDetector(
      //         onTap: () {
      //           Get.toNamed(Routes.myUnit);
      //         },
      //         child: Padding(
      //           padding: EdgeInsets.all(baseRadiusForm),
      //           child: Row(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Expanded(
      //                     flex: 1,
      //                     child:
      //                         Icon(Iconsax.house, color: colorTextTitle)),
      //                 Expanded(
      //                     flex: 5,
      //                     child: Text(
      //                       labelMyUnit,
      //                       style: TextStyle(
      //                           color: colorTextTitle,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 12),
      //                       maxLines: 1,
      //                       overflow: TextOverflow.ellipsis,
      //                     )),
      //                 Expanded(
      //                     flex: 1,
      //                     child: Align(
      //                       alignment: Alignment.centerRight,
      //                       child: Icon(Iconsax.arrow_right_3,
      //                           color: colorTextTitle),
      //                     ))
      //               ]),
      //         ),
      //       ),
      //       Visibility(
      //           visible: true,
      //           child: Divider(color: Colors.grey.shade200)),
      //       Visibility(
      //         visible: true,
      //         child: GestureDetector(
      //           onTap: () {},
      //           child: Padding(
      //             padding: EdgeInsets.all(baseRadiusForm),
      //             child: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Expanded(
      //                       flex: 1,
      //                       child:
      //                           Icon(Iconsax.setting, color: colorTextTitle)),
      //                   Expanded(
      //                       flex: 5,
      //                       child: Text(
      //                         labelManageAdmin,
      //                         style: TextStyle(
      //                             color: colorTextTitle,
      //                             fontWeight: FontWeight.bold,
      //                             fontSize: 12),
      //                         maxLines: 1,
      //                         overflow: TextOverflow.ellipsis,
      //                       )),
      //                   Expanded(
      //                       flex: 1,
      //                       child: Align(
      //                         alignment: Alignment.centerRight,
      //                         child: Icon(Iconsax.arrow_right_3,
      //                             color: colorTextTitle),
      //                       ))
      //                 ]),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // )
    );
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
                    onTap: () {
                      Get.toNamed(Routes.aboutAppPage);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(Iconsax.info_circle,
                                    color: colorTextTitle)),
                            Expanded(
                                flex: 5,
                                child: Text(
                                  labelAbout,
                                  style: TextStyle(
                                      color: colorTextTitle,
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
                                      color: colorTextTitle),
                                ))
                          ]),
                    ),
                  ),
                  Divider(color: Colors.grey.shade200),
                  GestureDetector(
                    onTap: () async {
                      StandardAlertDialog.show(
                          context,
                          "Keluar",
                          "Apakah Anda yakin keluar dari akun ini?", () async {
                        await controller.logout().whenComplete(() {
                          if (controller.logoutState.value.data == true) {
                            Get.offAllNamed(Routes.login);
                          } else {
                            showStandardSnackbar(context, TypeMessage.error,
                              message: controller.logoutState.value.error?.message.toString());
                          }
                        });
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
