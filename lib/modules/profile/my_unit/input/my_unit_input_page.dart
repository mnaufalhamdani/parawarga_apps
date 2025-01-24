// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/theme/standard_text_field.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../../routes/app_pages.dart';
import '../../../../theme/app_theme.dart';
import '../../../../theme/standard_snackbar.dart';
import 'my_unit_input_controller.dart';

class MyUnitInputPage extends GetView<MyUnitInputController> {
  const MyUnitInputPage({super.key});

  static const argAreaId = 'argAreaId';
  static const argUnit = 'argUnit';

  Future<void> checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showStandardSnackbar(Get.context!, TypeMessage.error,
          message: "Location services are disabled. Please enable them.");
    }

    // Request permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showStandardSnackbar(Get.context!, TypeMessage.error,
            message: "Location permission denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      showStandardSnackbar(Get.context!, TypeMessage.error,
          message: "Location permission is permanently denied.");
    }
  }

  @override
  Widget build(BuildContext context) {
    checkLocationPermission();
    return Scaffold(
      appBar: AppBar(
        title: Text(labelSettingUnit, style: TextStyle(color: colorPrimary)),
        centerTitle: true,
        backgroundColor: colorBackground,
        surfaceTintColor: colorBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorPrimary),
          onPressed: () { Get.back(); },
        ),
      ),
      body: Obx(() => _buildContentBackground(context)),
    );
  }

  _buildContentBackground(BuildContext context) {
    return Container(
      color: colorBackground,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(baseRadiusCard),
              topRight: Radius.circular(baseRadiusCard),
            ),
            color: colorPrimary),
        child: Padding(
            padding: EdgeInsets.only(top: baseRadiusCard),
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(baseRadiusCard),
                  topRight: Radius.circular(baseRadiusCard),
                ),
                color: colorBackground,
              ),
              child: _buildContentMainMenu(context),
            )))
    );
  }

  _buildContentMainMenu(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Form(
        key: controller.formKey,
        child: Column(children: [
          StandardTextField(
            editingController: controller.editingControllers[0],
            titleHint: labelName,
            msgError: msgFieldEmpty,
            inputAction: TextInputAction.next),
          StandardTextField(
            editingController: controller.editingControllers[1],
            titleHint: labelDesc,
            inputAction: TextInputAction.done),
          Padding(
            padding: EdgeInsets.only(left: basePadding, right: basePadding),
            child: GestureDetector(
              onTap: () async {
                final result = await Get.toNamed(Routes.myUnitInputMap);
                if (result != null){
                  final latLong = result as LatLng;
                  controller.myUnitDomain.value.latitude = latLong.latitude.toString();
                  controller.myUnitDomain.value.longitude = latLong.longitude.toString();
                  if (controller.myUnitDomain.value.latitude != null || controller.myUnitDomain.value.longitude != null) {
                    controller.isLocated.value = true;
                  }
                  showStandardSnackbar(Get.context!, TypeMessage.info, message: ":Lokasi telah diatur");
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text("Atur Lokasi Unit",
                      style: TextStyle(
                        color: colorTextMessage,
                        fontSize: 16)),
                  ),
                  Switch(
                    value: controller.isLocated.value,
                    onChanged: (value) async {
                      final result = await Get.toNamed(Routes.myUnitInputMap);
                      if (result != null){
                        final latLong = result as LatLng;
                        controller.myUnitDomain.value.latitude = latLong.latitude.toString();
                        controller.myUnitDomain.value.longitude = latLong.longitude.toString();
                        if (controller.myUnitDomain.value.latitude != null || controller.myUnitDomain.value.longitude != null) {
                          controller.isLocated.value = true;
                        }

                        showStandardSnackbar(Get.context!, TypeMessage.info, message: ":Lokasi telah diatur");
                      }
                    },
                    activeColor: colorPrimary, // Color when switched on
                    inactiveThumbColor: colorTextMessage, // Thumb color when off
                    inactiveTrackColor: Colors.grey.shade200, // Track color when off
                  ),
                ],
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: basePadding, right: basePadding, bottom: basePadding),
            child: Row(children: [
              Expanded(child: Text("Unit kontrak / sewa",
                style: TextStyle(
                  color: colorTextMessage,
                  fontSize: 16))),
              Switch(
                value: controller.isContract.value,
                onChanged: (value) {
                  controller.isContract.value = value;
                },
                activeColor: colorPrimary, // Color when switched on
                inactiveThumbColor: colorTextMessage, // Thumb color when off
                inactiveTrackColor: Colors.grey.shade200, // Track color when off
              ),
            ]),
          ),
          Container(
            width: Get.width,
            margin: EdgeInsets.only(left: basePadding, right: basePadding),
            child: StandardButtonPrimary(
              formKey: controller.formKey,
              titleHint: labelSubmit,
              isLoading: controller.saveOrRemoveState.value.isLoading,
              onPressed: () async {
                await controller.saveMyUnit().whenComplete(() {
                  if (controller.saveOrRemoveState.value.error != null){
                    showStandardSnackbar(context, TypeMessage.error, message: controller.saveOrRemoveState.value.error?.message.toString());
                  }else {
                    showStandardSnackbar(context, TypeMessage.success, message: controller.saveOrRemoveState.value.data?.data.toString());
                    Get.back();
                  }
                });
              },
            ),
          )
        ]),
      ));
  }
}
