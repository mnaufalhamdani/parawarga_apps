// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/modules/alarm/alarm_detail_page.dart';
import 'package:parawarga_apps/modules/dashboard/dashboard_controller.dart';
import 'package:parawarga_apps/modules/dashboard/item/dashboard_alarm_tile.dart';
import 'package:parawarga_apps/modules/info/detail/info_detail_page.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../theme/app_theme.dart';
import '../../theme/single_select/single_select_dialog.dart';
import '../../theme/single_select/single_select_domain.dart';
import '../../theme/standard_button_primary.dart';
import '../../theme/standard_text_field.dart';
import '../../utils/strings.dart';
import '../issue/detail/issue_detail_page.dart';
import 'item/dashboard_info_tile.dart';
import 'item/dashboard_issue_tile.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getViewDashboard();
    return Scaffold(
      body: Obx(() =>
          RefreshIndicator(
              color: colorPrimary,
              onRefresh: () async {
                await controller.getViewDashboard();
              },
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContentTop(context),
                      _buldContentSummary(context),
                      _buildContentAlarm(context),
                      _buildContentMenu(context),
                      _buildContentInfo(context),
                      _buildContentAdv(context),
                      _buildContentIssue(context),
                      // _buildContentVoting(context),
                    ],
                  )
              )),
      ),
      floatingActionButton: Visibility(visible: true,
          child: FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: Colors.red.shade700,
              onPressed: () {
                _buildDialogAlarm(context);
              },
              child: Icon(Iconsax.alarm, color: Colors.white)
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  _buildContentTop(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/background/img_background_header.png"),
                fit: BoxFit.cover)),
        child: Padding(
            padding: EdgeInsets.only(
                left: basePadding, right: basePadding, top: 50, bottom: 100),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.profile);
                    },
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/icon/img_menu.png"),
                                fit: BoxFit.cover)))),
              ]),
            ])));
  }

  _buldContentSummary(BuildContext context) {
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
          child: Column(
            children: [
              Container(
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
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  baseRadiusCard)),
                          color: colorPrimary,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.unitEmpty);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                                baseRadiusForm),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(labelUnitEmpty,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        color: colorLight)),
                                                Text(
                                                    "${controller.dashboardState
                                                        .value.data
                                                        ?.totalUnitEmpty ??
                                                        "-"} Unit",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: colorLight))
                                              ],
                                            ))),
                                    Container(
                                      color: colorLight,
                                      height: basePadding,
                                      width: 1,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.myArea);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.all(
                                                baseRadiusForm),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                Text(labelMyAreaUnit,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        color: colorLight)),
                                                Text(
                                                    "${controller.dashboardState
                                                        .value.data
                                                        ?.totalArea ??
                                                        ""} Area ${controller
                                                        .dashboardState.value
                                                        .data
                                                        ?.totalUnit ??
                                                        "-"} Unit",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: colorLight))
                                              ],
                                            ))),
                                  ]))))),
            ],
          ),
        ),
      ),
    );
  }

  _buildContentMenu(BuildContext context) {
    final authMenu = controller.authMenuState.value.data;
    if (authMenu == null) {
      return Container();
    }

    return GridView.count(
        padding: EdgeInsets.only(
            left: basePaddingInContent, right: basePaddingInContent),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        children: [
          for (int i = 0; i < authMenu.length; i++)
            GestureDetector(
                onTap: () {
                  Get.toNamed(authMenu[i].link.toString());
                },
                child: Column(children: [
                  Card(
                      color: colorSecondary,
                      child: Padding(
                          padding: EdgeInsets.all(baseRadiusForm),
                          child: SizedBox(
                              width: 35,
                              height: 35,
                              child: Icon(
                                  mapperIcon.entries
                                      .where((element) =>
                                  element.key == authMenu[i].icon)
                                      .first
                                      .value,
                                  color: colorDark
                              )))),
                  Text(authMenu[i].name.toString(),
                    style: TextStyle(
                        color: colorTextTitle,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.clip,)
                ]))
        ]
    );
  }

  _buildContentAlarm(BuildContext context) {
    final list = controller.dashboardState.value.data?.alarm;
    if (list == null || list.isEmpty == true) {
      return Container();
    }

    return Container(
        margin: EdgeInsets.only(top: basePadding),
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (int i = 0; i <
                  list.length; i++)
                Padding(
                    padding: EdgeInsets.only(
                        left: (i == 0) ? basePadding : basePadding /
                            2,
                        right: (i == list.length - 1)
                            ? basePadding
                            : basePadding / 2),
                    child: DashboardAlarmTile(
                      model: list[i],
                      onPressed: (model) async {
                        Get.toNamed(Routes.alarmDetail, arguments: {
                          AlarmDetailPage.argId: model.id.toString()
                        });
                      },
                    ))
            ])));
  }

  _buildContentInfo(BuildContext context) {
    final list = controller.dashboardState.value.data?.information;
    if (list == null || list.isEmpty == true) {
      return Container();
    }

    return Padding(
      padding: EdgeInsets.only(top: basePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: basePadding, right: basePadding),
              child: Row(
                children: [
                  Text(labelInfo,
                      style: TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.info);
                          },
                          icon: Icon(Iconsax.arrow_right_3,
                              color: colorDark, size: baseRadius),
                        ),
                      ))
                ],
              )),
          Container(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    for (int i = 0; i <
                        list.length; i++)
                      Padding(
                          padding: EdgeInsets.only(
                              left: (i == 0) ? basePadding : basePadding /
                                  2,
                              right: (i == list.length - 1)
                                  ? basePadding
                                  : basePadding / 2),
                          child: DashboardInfoTile(
                            model: list[i],
                            onPressed: (model) async {
                              Get.toNamed(Routes.infoDetail, arguments: {
                                InfoDetailPage.argId: model.id.toString()
                              });
                            },
                          ))
                  ])))
        ],
      ),
    );
  }

  _buildContentAdv(BuildContext context) {
    return Visibility(
        child: Padding(
          padding: EdgeInsets.only(
              top: basePadding, left: basePadding, right: basePadding),
          child: Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            elevation: 2,
            child: Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(baseRadiusForm),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://bithourproduction.com/blog/wp-content/uploads/2023/08/EmJaSRjUcAAPkTv.jpg"),
                        fit: BoxFit.cover))),
          ),
        ));
  }

  _buildContentIssue(BuildContext context) {
    final list = controller.dashboardState.value.data?.issue;
    if (list == null || list.isEmpty == true) {
      return Container();
    }

    return Visibility(
        visible: true,
        child: Padding(
            padding: EdgeInsets.only(
                top: basePadding, left: basePadding, right: basePadding),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(labelIssue,
                      style: TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.issue);
                          },
                          icon: Icon(Iconsax.arrow_right_3,
                              color: colorDark, size: baseRadius),
                        ),
                      ))
                ],
              ),
              Transform.translate(
                  offset: Offset(0, -20), child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return DashboardIssueTile(
                      model: list[index],
                      onPressed: (model) async {
                        Get.toNamed(Routes.issueDetail, arguments: {
                          IssueDetailPage.argId: model.id.toString()
                        });
                      },
                    );
                  }
              ))
            ])));
  }

  _buildDialogAlarm(BuildContext context) async {
    final listArea = controller.userAreaState.value.data?.areaEntity;
    if (listArea != null) {
      var areaSelected = listArea.first.area_id;
      await showDialog(
          context: context,
          builder: (context) =>
              Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(baseRadius)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: basePadding,
                          right: basePadding,
                          top: basePadding),
                      child: Text(labelAlarm,
                          style: TextStyle(
                              color: colorTextTitle,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: basePadding, right: basePadding),
                      child: Text(
                          "Jika Anda membutuhkan pertolongan secepatnya, silahkan mengisi form di bawah ini, maka alarm akan dikirim ke warga.",
                          style: TextStyle(
                              color: colorTextMessage,
                              fontSize: 12)),
                    ),
                    (listArea.length > 1)
                        ? Form(
                      key: controller.formKey,
                      child: StandardTextField(
                        editingController: controller.editingControllers[0],
                        titleHint: labelArea,
                        msgError: msgFieldEmpty,
                        readOnly: true,
                        inputAction: TextInputAction.next,
                        onPressed: () {
                          final listItem = List<SingleSelectDomain>.empty(
                              growable: true);
                          for (var i = 0; i < listArea.length; i++) {
                            listItem.add(SingleSelectDomain(
                                codeOrId: listArea[i].area_id.toString(),
                                message: listArea[i].area_name
                            ));
                          }

                          SingleSelectDialog.show(
                              context, "Pilih Salah Satu Area", listItem, (
                              idIndex,
                              model) {
                            areaSelected = int.parse(model.codeOrId.toString());
                            controller.editingControllers[0].text = model
                                .message.toString();
                          });
                        },
                      ),
                    )
                        : Container(),
                    StandardTextField(
                        editingController: controller.editingControllers[1],
                        titleHint: labelMessage,
                        inputAction: TextInputAction.done),
                    Container(
                      width: Get.width,
                      margin: EdgeInsets.all(basePadding),
                      child: Obx(() => StandardButtonPrimary(
                            titleHint: labelSubmit,
                            color: Colors.white,
                            buttonColor: Colors.red.shade700,
                            isLoading: controller.saveAlarmState.value
                                .isLoading,
                            onPressed: (() async {
                              var valid = true;
                              if (listArea.length > 1) {
                                if (!controller.formKey.currentState!
                                    .validate()) {
                                  valid = false;
                                }
                              }

                              if (valid) {
                                await controller.saveAlarm(areaSelected,
                                    controller.editingControllers[1].text
                                        .toString()).whenComplete(() {
                                  if (controller.saveAlarmState.value.error !=
                                      null) {
                                    showStandardSnackbar(
                                        context, TypeMessage.error,
                                        message: controller.saveAlarmState.value
                                            .error?.message.toString());
                                  } else {
                                    Get.back();
                                    controller.getViewDashboard();
                                    showStandardSnackbar(
                                        context, TypeMessage.success,
                                        message: controller.saveAlarmState.value
                                            .data?.data.toString());
                                  }
                                });
                              }
                            })
                        )
                      ),
                    )
                  ],
                ),
              )
      ).whenComplete(() {
        controller.editingControllers[0].text = "";
        controller.editingControllers[1].text = "";
      });
    } else {
      showStandardSnackbar(
          context, TypeMessage.error, message: "Area tidak ditemukan");
    }
  }
}
