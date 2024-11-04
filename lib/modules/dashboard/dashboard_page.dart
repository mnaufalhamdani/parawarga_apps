// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/modules/dashboard/dashboard_controller.dart';
import 'package:parawarga_apps/modules/dashboard/item/dashboard_laporan_tile.dart';
import 'package:parawarga_apps/modules/dashboard/item/dashboard_voting_tile.dart';
import 'package:parawarga_apps/theme/app_colors.dart';

import '../../core/constants.dart';
import '../../theme/app_theme.dart';
import '../../utils/strings.dart';
import 'item/dashboard_info_tile.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

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
          _buldContentSummary(context),
          _buildContentMenu(context),
          _buildContentInfo(context),
          _buildContentAdv(context),
          _buildContentLaporan(context),
          // _buildContentVoting(context),
        ],
      )),
    );
  }

  _buildContentTop(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding:
                EdgeInsets.only(left: basePadding, right: basePadding, top: 50),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.PROFILE);
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
              Padding(
                  padding: EdgeInsets.only(top: basePadding),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(greetingHi,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colorTextPrimary)))),
              Padding(
                  padding: EdgeInsets.only(bottom: basePadding),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(greetingDashboard,
                          style: TextStyle(color: colorTextPrimary)))),
            ])));
  }

  _buldContentSummary(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(basePadding),
                topRight: Radius.circular(basePadding)),
            color: Colors.white,
          ),
          child: Padding(
              padding: EdgeInsets.only(
                  left: basePadding, top: basePadding, right: basePadding),
              child: Card(
                  color: colorPrimary,
                  child: Padding(
                      padding: EdgeInsets.all(baseRadiusForm),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {},
                                child: Padding(
                                    padding: EdgeInsets.all(baseRadiusForm),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(labelEmptyHouse,
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: colorLight)),
                                        Text("22 Rumah",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: colorLight))
                                      ],
                                    ))),
                            Container(
                              color: colorDark,
                              height: basePadding,
                              width: 1,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Padding(
                                    padding: EdgeInsets.all(baseRadiusForm),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(labelMyArea,
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: colorLight)),
                                        Text("1 Area 2 Unit",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: colorLight))
                                      ],
                                    ))),
                          ]))))),
    );
  }

  _buildContentMenu(BuildContext context) {
    return Visibility(
        child: Padding(
          padding: EdgeInsets.only(top: basePadding, left: basePadding, right: basePadding),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Column(children: [
                      Card(
                          color: Colors.red.shade50,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: Image.asset("assets/images/icon/img_vote.png",
                                  height: 35,
                                  width: 35,
                                  color: Colors.red.shade400))),
                      Text(labelVoting,
                          style: TextStyle(
                              color: colorTextSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ])),
                GestureDetector(
                    onTap: () {},
                    child: Column(children: [
                      Card(
                          color: Colors.brown.shade50,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: Image.asset("assets/images/icon/img_users.png",
                                  height: 35,
                                  width: 35,
                                  color: Colors.brown.shade400))),
                      Text(labelArisan,
                          style: TextStyle(
                              color: colorTextSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ])),
                GestureDetector(
                    onTap: () {},
                    child: Column(children: [
                      Card(
                          color: Colors.blue.shade50,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: Image.asset("assets/images/icon/img_tagihan.png",
                                  height: 35,
                                  width: 35,
                                  color: Colors.blue.shade400))),
                      Text(labelTagihan,
                          style: TextStyle(
                              color: colorTextSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ])),
                GestureDetector(
                    onTap: () {},
                    child: Column(children: [
                      Card(
                          color: Colors.amber.shade50,
                          child: Padding(
                              padding: EdgeInsets.all(baseRadiusForm),
                              child: Image.asset("assets/images/icon/img_history.png",
                                  height: 35,
                                  width: 35,
                                  color: Colors.amber.shade400))),
                      Text(labelHistori,
                          style: TextStyle(
                              color: colorTextSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12))
                    ])),
              ])
        ));
  }

  _buildContentInfo(BuildContext context) {
    return Visibility(
        child: Padding(
      padding: EdgeInsets.only(top: basePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: basePadding),
              child: Text(labelInfo,
                  style: TextStyle(
                      color: colorPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))),
          Container(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    for (int i = 0; i < listInfo.length; i++)
                      Padding(
                          padding: EdgeInsets.only(
                              left: (i == 0) ? basePadding : basePadding / 2,
                              right: (i == listInfo.length - 1)
                                  ? basePadding
                                  : basePadding / 2),
                          child: DashboardInfoTile(
                            model: listInfo[i],
                            onPressed: (model) async {},
                          ))
                  ])))
        ],
      ),
    ));
  }

  _buildContentAdv(BuildContext context) {
    return Visibility(
        child: Padding(
          padding: EdgeInsets.only(left: basePadding, top: basePadding, right: basePadding),
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
                        image: NetworkImage("https://bithourproduction.com/blog/wp-content/uploads/2023/08/EmJaSRjUcAAPkTv.jpg"),
                        fit: BoxFit.cover))),
          ),
        ));
  }

  _buildContentLaporan(BuildContext context) {
    return Visibility(
        visible: true,
        child: Padding(
            padding: EdgeInsets.only(top: basePadding,left: basePadding, right: basePadding),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(labelLaporan,
                  style: TextStyle(
                      color: colorPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            Transform.translate(offset: Offset(0, -20), child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listLaporan.length,
                  itemBuilder: (context, index) {
                    return DashboardLaporanTile(
                      model: listLaporan[index],
                      onPressed: (model) async {
                      },
                    );
                  }
              ))
            ])));
  }

  _buildContentVoting(BuildContext context) {
    return Visibility(
        visible: true,
        child: Padding(
            padding: EdgeInsets.only(top: basePadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.only(left: basePadding),
                  child: Text(labelVoting,
                      style: TextStyle(
                          color: colorTextPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))),
              Container(
                  child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        for (int i = 0; i < listVoting.length; i++)
                          Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      (i == 0) ? basePadding : basePadding / 2,
                                  right: (i == listVoting.length - 1)
                                      ? basePadding
                                      : basePadding / 2),
                              child: DashboardVotingTile(
                                model: listVoting[i],
                                onPressed: (model) async {},
                              ))
                      ])))
            ])));
  }
}
