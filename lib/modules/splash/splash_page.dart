// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:colorful_progress_indicators/colorful_progress_indicators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/modules/splash/splash_controller.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../theme/app_colors.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.checkSession();

    return Scaffold(
      backgroundColor: colorDark,
      body: _buildContent(context));
  }

  _buildContent(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: colorDark, shape: BoxShape.circle),
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/logo/img_logo.png',
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(appName.toUpperCase(),
                    style: TextStyle(
                        fontSize: 40,
                        color: colorPrimary,
                        fontFamily: 'quicksand',
                        letterSpacing: 1.5))),
            Text(appTag,
                style: TextStyle(
                    color: colorLight,
                    fontFamily: 'evolvesans',
                    letterSpacing: 1.5)),
            Padding(
                padding: EdgeInsets.only(left: 50, top: 50, right: 50),
                child: ColorfulLinearProgressIndicator(
                  colors: [
                    colorPrimary,
                    colorSecondary,
                  ],
                  duration: Duration(milliseconds: 500),
                  initialColor: colorPrimary,
                )),
          ],
        ));
  }
}
