// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyUnitInputMapController extends GetxController{
  final mapController = Rxn<GoogleMapController>();
  final selectedLocation = Rxn<LatLng>();
  final markers = RxSet<Marker>();
}
