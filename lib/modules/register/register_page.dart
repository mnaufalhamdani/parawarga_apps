// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:parawarga_apps/core/failure_response.dart';
import 'package:parawarga_apps/modules/register/register_controller.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/app_theme.dart';
import 'package:parawarga_apps/theme/standard_button_register.dart';
import 'package:parawarga_apps/theme/standard_snackbar.dart';

import '../../core/data_state.dart';
import '../../models/domain/register_warga_domain.dart';
import '../../theme/standard_text_field.dart';
import '../../utils/strings.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() => PopScope(
        canPop: (controller.activeStep.value == 0) ? true : false,
        onPopInvoked: (didPop) {
          if(controller.activeStep > 0) {
            controller.activeStep.value -= 1;
          }
        },
        child: Scaffold(
            body: Container(
                  child: Form(
                      key: controller.formKeyThird,
                      child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: basePadding, right: basePadding, top: 50),
                          child: Row(children: _iconViews())),
                      _buildContentFirst(context),
                      _buildContentSecond(context),
                      _buildContentThird(context),
                      _buildContentBottom(context)
                    ],
                  ))
            )
        )
    )));
  }

  _iconViews() {
    var activeColor = colorPrimary;
    var inactiveColor = Colors.grey.shade100;
    var list = <Widget>[];
    var icons = <IconData>[Iconsax.home, Iconsax.card, Iconsax.user];

    icons.asMap().forEach((i, icon) {
      var circleColor =
          controller.activeStep.value >= i ? activeColor : inactiveColor;

      var lineColor =
          controller.activeStep.value > i ? activeColor : inactiveColor;

      var iconColor =
          controller.activeStep.value >= i ? inactiveColor : activeColor;

      list.add(
        Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: circleColor,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              border: Border.all(
                color: activeColor,
                width: 2,
              ),
            ),
            child: Icon(icon, color: iconColor, size: 15)),
      );

      if (i != icons.length - 1) {
        list.add(Expanded(child: Container(height: 2, color: lineColor)));
      }
    });

    return list;
  }

  _buildContentFirst(BuildContext context) {
    return Visibility(
        visible: (controller.activeStep.value == 0) ? true : false,
        child: Expanded(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: basePadding, right: basePadding, top: 50),
                  child: Text(greetingRegister,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: colorTextPrimary))),
              Padding(
                  padding: EdgeInsets.only(
                      left: basePadding, top: 5, right: basePadding),
                  child: Text(greetingRegisterMessage,
                      style: TextStyle(color: colorTextSecondary))),
              Padding(
                  padding: EdgeInsets.only(
                      left: basePadding, top: 5, right: basePadding),
                  child: GestureDetector(
                    onTap: () {
                      // Get.toNamed(Routes.register);
                    },
                    child: Text(labelRegisterSubMessage,
                        style: TextStyle(
                            color: colorButtonPrimary,
                            fontWeight: FontWeight.bold)),
                  )),
              Form(
                  key: controller.formKeyFirst,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: StandardTextField(
                            editingController:
                                controller.editingControllersFirst[0],
                            titleHint: labelKodeArea,
                            msgError: msgFieldEmpty,
                            inputAction: TextInputAction.done)),
                      Padding(padding: EdgeInsets.only(top: 20), child:
                        SizedBox(
                            height: 42,
                            child: RawMaterialButton(
                              onPressed: () {
                                if (controller.formKeyFirst.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  controller.checkArea();
                                }
                              },
                              shape: CircleBorder(),
                              elevation: 2,
                              fillColor: colorButtonPrimary,
                              child: Icon(Iconsax.search_normal_1,
                                  color: Colors.white),
                            )))
                    ],
                  )),
              Visibility(
                  visible:
                      (controller.checkAreaState.value is ResponseSuccess) ? true : false,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: basePadding,
                          top: basePadding,
                          right: basePadding),
                      child: SizedBox(
                          width: Get.width,
                          child: Text.rich(TextSpan(
                              text: "Area ditemukan :",
                              style: TextStyle(color: colorTextSecondary),
                              children: [
                                TextSpan(
                                    text: (controller.checkAreaState.value.data as RegisterWargaDomain?)?.resultArea,
                                    style: TextStyle(
                                        color: colorTextSecondary,
                                        fontWeight: FontWeight.bold))
                              ]))))),
              Visibility(
                  visible: (controller.checkAreaState.value is ResponseSuccess)
                      ? true
                      : false,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: basePadding,
                          top: basePadding,
                          right: basePadding),
                      child: SizedBox(
                          width: Get.width,
                          child: Text.rich(TextSpan(
                              text: "Penanggung Jawab :",
                              style: TextStyle(color: colorTextSecondary),
                              children: [
                                TextSpan(
                                    text: (controller.checkAreaState.value.data as RegisterWargaDomain?)?.resultResponsible,
                                    style: TextStyle(
                                        color: colorTextSecondary,
                                        fontWeight: FontWeight.bold))
                              ])))))
            ]))));
  }

  _buildContentSecond(BuildContext context) {
    return Visibility(
        visible: (controller.activeStep.value == 1) ? true : false,
        child: Expanded(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: basePadding, right: basePadding, top: 50),
                          child: Text(greetingRegister,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: colorTextPrimary))),
                      Padding(
                          padding: EdgeInsets.only(
                              left: basePadding, top: 5, right: basePadding),
                          child: Text(greetingRegisterMessage2,
                              style: TextStyle(color: colorTextSecondary))),
                      Form(
                          key: controller.formKeySecond,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: StandardTextField(
                                      editingController:
                                      controller.editingControllersSecond[0],
                                      titleHint: labelKtp,
                                      maxLength: 16,
                                      msgError: msgFieldEmpty,
                                      inputType: TextInputType.number,
                                      inputAction: TextInputAction.done)),
                              Padding(padding: EdgeInsets.only(top: 20), child:
                              SizedBox(
                                  height: 42,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      if (controller.formKeySecond.currentState!.validate()) {
                                        if(controller.editingControllersSecond[0].text.length < 16) {
                                          showStandardSnackbar(context, TypeMessage.error, message: "Isian terlalu pendek", paddingBottom: 60);
                                          return;
                                        }

                                        FocusScope.of(context).unfocus();
                                        controller.checkId();
                                      }
                                    },
                                    shape: CircleBorder(),
                                    elevation: 2,
                                    fillColor: colorButtonPrimary,
                                    child: Icon(Iconsax.search_normal_1,
                                        color: Colors.white),
                                  )))
                            ],
                          )),
                      Visibility(
                          visible:
                          (controller.checkIdState.value is ResponseSuccess) ? true : false,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: basePadding,
                                  top: basePadding,
                                  right: basePadding),
                              child: SizedBox(
                                  width: Get.width,
                                  child: Text.rich(TextSpan(
                                      text: "Hasil Pencarian :",
                                      style: TextStyle(color: colorTextSecondary),
                                      children: [
                                        TextSpan(
                                            text: (controller.checkIdState.value.data as String?)?.toString(),
                                            style: TextStyle(
                                                color: colorTextSecondary,
                                                fontWeight: FontWeight.bold))
                                      ]))))),
                    ]))));
  }

  _buildContentThird(BuildContext context) {
    return Visibility(
        visible: (controller.activeStep.value == 2) ? true : false,
        child: Expanded(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: basePadding, right: basePadding, top: 50),
                          child: Text(greetingRegister,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: colorTextPrimary))),
                      Padding(
                          padding: EdgeInsets.only(
                              left: basePadding, top: 5, right: basePadding),
                          child: Text(greetingRegisterMessage3,
                              style: TextStyle(color: colorTextSecondary))),
                      StandardTextField(
                          editingController: controller.editingControllersThird[0],
                          titleHint: labelName,
                          msgError: msgFieldEmpty,
                          inputAction: TextInputAction.next),
                      StandardTextField(
                          editingController: controller.editingControllersThird[1],
                          titleHint: labelAddress,
                          msgError: msgFieldEmpty,
                          inputAction: TextInputAction.next),
                      StandardTextField(
                          editingController: controller.editingControllersThird[2],
                          titleHint: labelAddressSecond,
                          msgError: msgFieldEmpty,
                          inputAction: TextInputAction.next),
                      StandardTextField(
                          editingController: controller.editingControllersThird[3],
                          titleHint: labelEmail,
                          msgError: msgFieldEmpty,
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next),
                      StandardTextField(
                          editingController: controller.editingControllersThird[4],
                          titleHint: labelPhone,
                          msgError: msgFieldEmpty,
                          inputType: TextInputType.number,
                          inputAction: TextInputAction.done),
                    ]))));
  }

  _buildContentBottom(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: StandardButtonRegister(
                    titleHint: (controller.activeStep.value == 0)
                        ? labelBatal
                        : labelPrev,
                    buttonColor: (controller.activeStep.value == 0)
                        ? Colors.red
                        : colorButtonThird,
                    onPressed: () async {
                      (controller.activeStep.value == 0)
                          ? Get.back()
                          : controller.activeStep.value -= 1;
                    })),
            Flexible(
                flex: 1,
                child: StandardButtonRegister(
                    titleHint: (controller.activeStep.value >= 2)
                        ? labelSubmit
                        : labelNext,
                    buttonColor: colorButtonPrimary,
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();

                      if(controller.activeStep.value == 0
                          && (controller.checkAreaState.value.data as RegisterWargaDomain?)?.area_code_generate == null) {
                        showStandardSnackbar(context, TypeMessage.error, message: "Area tidak ditemukan", paddingBottom: 60);
                        return;
                      }

                      if(controller.activeStep.value == 1
                          && controller.registerWargaDomain.value.nik == null) {
                        showStandardSnackbar(context, TypeMessage.error, message: "Belum melakukan pencarian nomor identitas", paddingBottom: 60);
                        return;
                      }

                      if(controller.activeStep.value >= 2) {
                        if (controller.formKeyThird.currentState!.validate()) {
                          await controller.registerAsync();

                          if (controller.registerState.value is ResponseSuccess){
                            showStandardSnackbar(context, TypeMessage.success, message: "Data berhasil terdaftar, silahkan aktivasi melalui email Anda", duration: DurationMessage.lengthLong);
                            Get.back();
                          }else if (controller.registerState.value is ResponseFailed){
                            final error = controller.registerState.value.data as FailureResponse;
                            showStandardSnackbar(context, TypeMessage.error, message: error.message, paddingBottom: 60);
                          }

                          return;
                        }
                      }else {
                        controller.activeStep.value += 1;
                      }

                    })),
          ],
        ));
  }
}
