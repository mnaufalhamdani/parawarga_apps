// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/login/login_controller.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_login.dart';
import 'package:parawarga_apps/theme/standard_text_field_login.dart';

import '../../theme/app_theme.dart';
import '../../theme/standard_snackbar.dart';
import '../../utils/strings.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContent(context),
              _buildContentBottom(context)
            ],
          )
      ),
    );
  }

  _buildContent(BuildContext context) {
    return Obx(() {
      return Form(
          key: controller.formKey,
          child: Column(
              children: [
                Container(
                  child: Padding(
                      padding: EdgeInsets.only(top: 80, bottom: 40),
                      child: Image.asset(
                        'assets/images/logo/img_logo.png',
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                      )),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: basePadding, right: basePadding),
                    child: SizedBox(
                        width: Get.width, child: Text(greetingWelcome,
                        style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colorPrimary)))),
                Padding(
                    padding: EdgeInsets.only(
                        left: basePadding, top: 5, right: basePadding),
                    child: SizedBox(width: Get.width, child: Text(greetingLogin,
                        style: TextStyle(color: colorTextPrimary)))),
                StandardTextFieldLogin(
                    editingController: controller.editingControllers[0],
                    titleHint: labelEmail,
                    msgError: msgFieldEmpty,
                    iconField: Icon(Iconsax.user)),
                StandardTextFieldLogin(
                    editingController: controller.editingControllers[1],
                    titleHint: labelPassword,
                    msgError: msgFieldEmpty,
                    iconField: Icon(Iconsax.lock_1),
                    inputAction: TextInputAction.done,
                    isPassword: true),
                Padding(padding: EdgeInsets.only(top: basePadding), child: Row(
                  children: [
                    Expanded(child: StandardButtonLogin(
                        formKey: controller.formKey,
                        titleHint: labelLogin.toUpperCase(),
                        buttonColor: colorButtonPrimary,
                        isLoading: controller.loginState.value.isLoading,
                        onPressed: () async {
                          FocusScope.of(context).unfocus();

                          await controller.login().whenComplete(() {
                            if(controller.loginState.value.data != null){
                              Get.offAllNamed(Routes.dashboard);
                            } else {
                              showStandardSnackbar(context, TypeMessage.error, message:  controller.loginState.value.error?.message.toString(), duration: DurationMessage.lengthShort);
                            }
                          });
                        }
                    )),
                    SizedBox(
                        height: 42,
                        child: RawMaterialButton(
                          onPressed: () {},
                          shape: CircleBorder(),
                          elevation: 2,
                          fillColor: Colors.red,
                          child: Icon(Iconsax.key, color: Colors.white),
                        )
                    )
                  ],
                )
                )
              ]
          )
      );
    });
  }

  _buildContentBottom(BuildContext context) {
    return Container(
        height: 150,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(greetingCreateAccount,
                style: TextStyle(color: colorTextPrimary)),
            Padding(padding: EdgeInsets.only(left: 5), child:
            GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.register);
                },
                child: Padding(padding: EdgeInsets.only(
                    top: basePadding, bottom: basePadding),
                    child: Text(labelCreateAccount,
                        style: TextStyle(color: colorButtonPrimary,
                            fontWeight: FontWeight.bold))
                )
            )
            )
          ],
        )
    );
  }
}
