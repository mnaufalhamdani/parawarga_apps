// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/modules/login/login_controller.dart';
import 'package:parawarga_apps/routes/app_pages.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_login.dart';
import 'package:parawarga_apps/theme/standard_text_field_login.dart';

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
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(width: MediaQuery.of(context).size.width, child: Text(greetingWelcome,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colorPrimary)))),
                Padding(
                    padding: EdgeInsets.only(left: 20, top: 5, right: 20),
                    child: SizedBox(width: MediaQuery.of(context).size.width, child: Text(greetingLogin,
                        style: TextStyle(color: colorTextPrimary)))),
                StandardTextFieldLogin(
                    editingController: controller.editingControllers[0],
                    titleHint: labelUsername,
                    msgError: msgFieldEmpty,
                    iconField: Icon(Iconsax.user)),
                StandardTextFieldLogin(
                    editingController: controller.editingControllers[1],
                    titleHint: labelPassword,
                    msgError: msgFieldEmpty,
                    iconField: Icon(Iconsax.lock_1),
                    inputAction: TextInputAction.done,
                    isPassword: true),
                Padding(padding: EdgeInsets.only(top: 20), child: Row(
                  children: [
                    Expanded(child: StandardButtonLogin(
                        formKey: controller.formKey,
                        titleHint: labelLogin.toUpperCase(),
                        buttonColor: colorButtonPrimary,
                        isLoading: controller.initLoading.value,
                        onPressed: () async {
                          if (controller.formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();

                            Get.offAllNamed(Routes.dashboard);
                            // await controller.getLogin().whenComplete(() {
                            //   if(controller.initMessage.value.isEmpty){
                            //     Get.offAllNamed(Routes.dashboard);
                            //   }else {
                            //     showStandardSnackbar(context, TypeMessage.error, controller.initMessage.value, DurationMessage.lengthShort);
                            //   }
                            // });
                          }
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
          TextButton(
            onPressed: () {
              // Get.toNamed(AppRoutes.RESET);
            },
            child: Text(labelCreateAccount,
                style: TextStyle(color: colorButtonPrimary, fontWeight: FontWeight.bold)),
          )
        ],
      )
    );
  }
}
