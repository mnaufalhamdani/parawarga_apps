import 'package:flutter/material.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

Color colorPrimary = HexColor("#D52C29");
Color colorText = HexColor("#140f1f");
Color colorRed100 = HexColor("#FFCDD2");
Color colorGrey200 = HexColor("#EEEEEE");
Color colorGreen100 = HexColor("#C8E6C9");
Color colorBlue100 = HexColor("#BBDEFB");

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}