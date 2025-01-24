import 'dart:convert';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parawarga_apps/core/failure_response.dart';
import 'package:permission_handler/permission_handler.dart';

import '../theme/standard_snackbar.dart';
import '../utils/strings.dart';


// const String NIK_EXAMPLE = '20101720';

// List<PengaturanAutocodeEntity> prePengaturanAutocode = [
//   PengaturanAutocodeEntity(code: "last-sync-switch_user", value: "false"),
// ];
List<String> listExample = [
  "Indonesia", "Malaysia", "Brunei", "Myanmar", "Singapore"
];

Map<String, IconData> mapperIcon = <String, IconData>{
  'like_dislike': Iconsax.like_dislike,
  '3d_cube': Iconsax.convert_3d_cube,
  'card_pos': Iconsax.card_pos,
  'history': Iconsax.timer,
  'all_menu': Iconsax.clipboard_text,
  'admin': Iconsax.user_octagon,
  'unit': Iconsax.house,
  'setting': Iconsax.setting,
  'about': Icons.help_outline_rounded,
  'logout': Iconsax.profile_delete,
};

Future<void> checkPermissionStatus() async {
  final locationEnabled = await Geolocator.isLocationServiceEnabled();

  if (await Permission.storage.status.isDenied) {
    await Permission.storage.request().whenComplete(() async {
      if (await Permission.storage.status.isDenied) {
        return showStandardSnackbar(Get.context!, TypeMessage.error, message: msgStorageDenied, duration: DurationMessage.lengthLong);
      }
    });
  }

  if (await Permission.manageExternalStorage.status.isDenied) {
    await Permission.manageExternalStorage.request().whenComplete(() async {
      if (await Permission.manageExternalStorage.status.isDenied) {
        return showStandardSnackbar(Get.context!, TypeMessage.error, message: msgStorageDenied, duration: DurationMessage.lengthLong);
      }
    });
  }

  if (await Permission.location.status.isDenied) {
    await Permission.location.request().whenComplete(() async {
      if (await Permission.location.status.isDenied) {
        return showStandardSnackbar(Get.context!, TypeMessage.error, message: msgLocationDenied, duration: DurationMessage.lengthLong);
      }
    });
  }

  if (!locationEnabled) {
    return showStandardSnackbar(Get.context!, TypeMessage.error, message: msgLocationNotEnabled, duration: DurationMessage.lengthLong);
  }
}

String generateRandomId() {
  final random = Random();
  const length = 11;
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final id = StringBuffer();

  for (var i = 0; i < length; i++) {
    id.write(chars[random.nextInt(chars.length)]);
  }

  return id.toString();
}

String generateCode(int lastCode) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final id = StringBuffer();

  for (var i = 0; i < lastCode; i++) {
    id.write(chars[random.nextInt(chars.length)]);
  }

  return id.toString();
}

Future<void> pickerPhoto(ImageSource source, final void Function(String path) onPicked) async {
  final picked = await ImagePicker().pickImage(source: source, imageQuality: 70);
  if(picked == null) return;

  onPicked(picked.path);
}

String getFileSizeString({required int bytes, int decimals = 0}) {
  const suffixes = ["b", "kb", "mb", "gb", "tb"];
  if (bytes == 0) return '0${suffixes[0]}';
  var i = (log(bytes) / log(1024)).floor();
  return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
}

String strToBinary(String text) {
  List<int> encodedBytes = utf8.encode(text);
  return encodedBytes.map((e) =>
      e.toRadixString(2).padLeft(8, '0')
  ).join();
}

String binaryToStr(String encode) {
  List<int> decodedBytes = [];
  for (int i = 0; i < encode.length; i += 8) {
    String byteString = encode.substring(i, i + 8);
    int byte = int.parse(byteString, radix: 2);
    decodedBytes.add(byte);
  }
  return utf8.decode(decodedBytes);
}

int? stringToInt(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  try {
    return int.tryParse(value);
  } catch (e) {
    debugPrint('stringToInt: ${e.toString()}');
    return null;
  }
}

int dateBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

Future<bool> checkConnection() async {
  var connected = false;
  print("object");
  await Connectivity().checkConnectivity().then((value) {
    if (value.where((element) =>
      element == ConnectivityResult.mobile
      || element == ConnectivityResult.wifi
      || element == ConnectivityResult.ethernet).isNotEmpty) {
      print("object1");
      connected = true;
    }
  });
  return connected;
}

String getInitials(String text) {
  if (text.isEmpty) return "";

  List<String> nameParts = text.split(" ");
  String initials = nameParts.map((e) => e.isNotEmpty ? e[0].toUpperCase() : "").join();

  return initials.length > 2 ? initials.substring(0, 2) : initials; // Limit to 2 initials
}

String currencyFormat(String number) {
  List<String> parts = number.split('.');
  String integerPart = parts[0].replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => '.',
  );
  if(parts.length == 1){
    return integerPart;
  }else{
    return '$integerPart,${parts[1]}';
  }

}

Future<Position?> getLocation() async {
  Position? position;
  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) {
    position = value;
  }).catchError((error) {
    throw FailureResponse(message: error.toString());
  });
  return position;
}

Future<String> getAddressLocation(double latitude, double longitude) async {
  String response = msgUnknown;
  await placemarkFromCoordinates(latitude, longitude).then((value) {
    if (value.isNotEmpty) {
      response = "${value.first.street}, ${value.first.subLocality}, ${value.first.locality}, ${value.first.subAdministrativeArea}, ${value.first.administrativeArea}, ${value.first.country}";
    }else{
      response = "ini $msgUnknown";
    }
  }).catchError((error) {
    throw FailureResponse(message: error.toString());
  });
  return response;
}