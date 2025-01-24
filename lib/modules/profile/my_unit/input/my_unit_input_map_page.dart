// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parawarga_apps/core/constants.dart';
import 'package:parawarga_apps/theme/app_colors.dart';
import 'package:parawarga_apps/theme/standard_button_primary.dart';
import 'package:parawarga_apps/utils/strings.dart';

import '../../../../theme/app_theme.dart';
import '../../../../theme/standard_snackbar.dart';
import 'my_unit_input_map_controller.dart';

class MyUnitInputMapPage extends GetView<MyUnitInputMapController> {
  const MyUnitInputMapPage({super.key});

  static const argLatitude = 'argLatitude';
  static const argLongitude = 'argLongitude';

  Future<void> getUserLocation(BuildContext context) async {
    await checkPermissionStatus();

    // Get current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // onInit
    controller.markers.add(Marker(
      markerId: MarkerId("selected_location"),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: InfoWindow(title: 'Lokasi Dipilih')
    ));
    controller.selectedLocation.value =
        LatLng(position.latitude, position.longitude);
  }

  Future<void> onMapTap(LatLng latLng) async {
    //onTap
    controller.markers.removeWhere(
        (element) => element.markerId == MarkerId("selected_position"));
    // final address = await getAddressLocation(latLng.latitude, latLng.longitude);
    controller.markers.add(Marker(
      markerId: MarkerId("selected_location"),
      position: LatLng(latLng.latitude, latLng.longitude),
      infoWindow: InfoWindow(title: 'Lokasi Dipilih')
    ));
    controller.selectedLocation.value = latLng;
  }

  @override
  Widget build(BuildContext context) {
    getUserLocation(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(labelChooseLocation, style: TextStyle(color: colorPrimary)),
          centerTitle: true,
          backgroundColor: colorBackground,
          surfaceTintColor: colorBackground,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: colorPrimary),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(() => _buildContentBackground(context)));
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
                    child: Padding(
                      padding: EdgeInsets.all(basePadding),
                      child: _buildContentMainMenu(context),
                    )))));
  }

  _buildContentMainMenu(BuildContext context) {
    if (controller.selectedLocation.value != null) {
      return Column(
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(baseRadiusCard)),
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(controller.selectedLocation.value!.latitude,
                    controller.selectedLocation.value!.longitude),
                zoom: 17.0,
              ),
              onTap: onMapTap,
              markers: controller.markers,
              onMapCreated: (mapController) {
                controller.mapController.value = mapController;
              },
            ),
          )),
          SizedBox(height: basePadding),
          SizedBox(
              width: Get.width,
              child: Visibility(
                visible: (controller.selectedLocation.value != null),
                child: StandardButtonPrimary(
                  titleHint: labelSubmit,
                  onPressed: () {
                    log("message::");
                    if (controller.selectedLocation.value != null) {
                      Get.back(result: controller.selectedLocation.value);
                    } else {
                      showStandardSnackbar(context, TypeMessage.error,
                          message: "No location selected.");
                    }
                  },
                ),
              ))
        ],
      );
    } else {
      return Container();
    }
  }
}
