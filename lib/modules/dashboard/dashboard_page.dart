// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/dashboard/dashboard_controller.dart';
import 'package:parawarga_apps/modules/info/detail/info_detail_page.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/app_colors.dart';

import '../../theme/app_theme.dart';
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
      body: Obx(() => RefreshIndicator(
        color: colorPrimary,
        onRefresh: () async { await controller.getViewDashboard(); },
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContentTop(context),
                  _buldContentSummary(context),
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
              backgroundColor: Colors.red,
              onPressed: () {},
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                Text("${controller.dashboardState
                                                    .value.data
                                                    ?.totalUnitEmpty ?? "-"} Unit",
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
                                                Text(labelMyArea,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        color: colorLight)),
                                                Text(
                                                    "${controller.dashboardState
                                                        .value.data
                                                        ?.totalArea ?? ""} Area ${controller
                                                        .dashboardState.value
                                                        .data
                                                        ?.totalUnit ?? "-"} Unit",
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
    return Visibility(
        child: Padding(
            padding: EdgeInsets.only(left: basePadding, right: basePadding),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.voting);
                      },
                      child: Column(children: [
                        Card(
                            color: colorSecondary,
                            child: Padding(
                                padding: EdgeInsets.all(baseRadiusForm),
                                child: SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: Icon(Iconsax.like_dislike,
                                        color: colorDark)))),
                        Text(labelVoting,
                            style: TextStyle(
                                color: colorTextTitle,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))
                      ])),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.arisan);
                      },
                      child: Column(children: [
                        Card(
                            color: colorSecondary,
                            child: Padding(
                                padding: EdgeInsets.all(baseRadiusForm),
                                child: SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: Icon(Iconsax.convert_3d_cube,
                                        color: colorDark)))),
                        Text(labelArisan,
                            style: TextStyle(
                                color: colorTextTitle,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))
                      ])),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.tagihan);
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
                                        Iconsax.card_pos, color: colorDark)))),
                        Text(labelTagihan,
                            style: TextStyle(
                                color: colorTextTitle,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))
                      ])),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.history);
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
                                        Iconsax.timer, color: colorDark)))
                        ),
                        Text(labelHistory,
                            style: TextStyle(
                                color: colorTextTitle,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))
                      ])),
                ])
        ));
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
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.info);
                          },
                          child: Card(
                              color: colorSecondary,
                              child: Padding(
                                  padding: EdgeInsets.all(baseRadiusForm),
                                  child: Icon(Iconsax.arrow_right_3,
                                      color: colorDark))),
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
              left: basePadding, top: basePadding, right: basePadding),
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
                  Text(labelLaporan,
                      style: TextStyle(
                          color: colorPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.issue);
                          },
                          child: Card(
                              color: colorSecondary,
                              child: Padding(
                                  padding: EdgeInsets.all(baseRadiusForm),
                                  child: Icon(Iconsax.arrow_right_3,
                                      color: colorDark))),
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
}
