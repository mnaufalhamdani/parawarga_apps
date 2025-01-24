// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/profile/about_app/about_app_controller.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/strings.dart';

class AboutAppPage extends GetView<AboutAppController> {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("", style: TextStyle(color: colorBackground)),
        centerTitle: true,
        backgroundColor: colorPrimary,
        surfaceTintColor: colorPrimary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorBackground),
          onPressed: () { Get.back(); },
        ),
      ),
      body: _buildContentBackground(context)
    );
  }

  _buildContentBackground(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            color: colorPrimary,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo/img_logo_white.png',
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
                Text(appName.toUpperCase(),
                  style: TextStyle(
                    fontSize: 30,
                    color: colorLight,
                    fontFamily: 'quicksand',
                    letterSpacing: 1.5)),
                Text(appTag,
                  style: TextStyle(
                      color: colorLight,
                      fontFamily: 'evolvesans',
                      letterSpacing: 1.5)),
                SizedBox(height: basePadding)
          ]
            )
          ),
          Container(
            color: colorPrimary,
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(baseRadiusCard),
                  topRight: Radius.circular(baseRadiusCard),
                ),
                color: colorBackground,
              ),
              child: Obx(() => _buildContentMainMenu(context)),
            ),
          )
        ]
      ),
    );
  }

  _buildContentMainMenu(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(basePaddingInContent),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContentAbout(),
            _buildContentSuperior(),
            _buildContentAddress()
          ]),
        ));
  }

  _buildContentAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: basePaddingInContent),
        Text(
          labelAbout,
          style: TextStyle(
              color: colorTextTitle,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        SizedBox(height: basePaddingInContent),
        Text(
          controller.textAbout.value,
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: colorTextMessage, fontSize: 12),
        ),
        SizedBox(height: basePaddingInContent),
      ]
    );
  }

  _buildContentSuperior() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.grey.shade200),
          SizedBox(height: basePaddingInContent),
          Text(
            labelSuperiority,
            style: TextStyle(
                color: colorTextTitle,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          (controller.textSuperiority.isNotEmpty)
              ? ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: baseRadiusForm),
              itemCount: controller.textSuperiority.length,
              itemBuilder: (context, index) {
                final splitValue = controller.textSuperiority[index].split(" : ");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    splitValue[0],
                    style: TextStyle(color: colorTextMessage, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    splitValue[1],
                    style: TextStyle(
                        color: colorTextMessage,
                        fontSize: 12),
                  ),
                  SizedBox(height: basePaddingInContent)
                ]);
              })
              : Container(),
          SizedBox(height: basePaddingInContent),
        ]
    );
  }

  _buildContentAddress() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.grey.shade200),
          SizedBox(height: basePaddingInContent),
          Text(
            labelOfficeHour,
            style: TextStyle(
                color: colorTextTitle,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          (controller.textOfficeHour.isNotEmpty)
          ? ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: baseRadiusForm),
            itemCount: controller.textOfficeHour.length,
            itemBuilder: (context, index) {
              final splitValue = controller.textOfficeHour[index].split(" : ");
              return Row(children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    splitValue[0],
                    style: TextStyle(color: colorTextMessage, fontSize: 11),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ":",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorTextMessage, fontSize: 11),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      splitValue[1],
                      style: TextStyle(
                          color: colorTextMessage,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]);
            })
          : Container(),
          SizedBox(height: basePaddingInContent),
          Row(children: [
            Icon(Iconsax.location, color: colorTextMessage, size: 12),
            SizedBox(width: basePaddingInContent),
            Expanded(
              flex: 2,
              child: Text(
                labelAddress,
                style: TextStyle(color: colorTextMessage, fontSize: 11),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                ":",
                textAlign: TextAlign.center,
                style: TextStyle(color: colorTextMessage, fontSize: 11),
              ),
            ),
            Expanded(
              flex: 7,
              child: Text(
                controller.textAddress.value,
                style: TextStyle(
                    color: colorTextMessage,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ]),
          Row(children: [
            Icon(Iconsax.call, color: colorTextMessage, size: 12),
            SizedBox(width: basePaddingInContent),
            Expanded(
              flex: 2,
              child: Text(
                labelPhone,
                style: TextStyle(color: colorTextMessage, fontSize: 11),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                ":",
                textAlign: TextAlign.center,
                style: TextStyle(color: colorTextMessage, fontSize: 11),
              ),
            ),
            Expanded(
              flex: 7,
              child: Text(
                controller.textPhone.value,
                style: TextStyle(
                    color: colorTextMessage,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ]),
          SizedBox(height: basePaddingInContent),
        ]
    );
  }
}
