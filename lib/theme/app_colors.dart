import 'package:flutter/material.dart';

Color colorPrimary = HexColor("#04BA71");
Color colorSecondary = HexColor("#FDC827");
Color colorDark = HexColor("#04454D");
Color colorLight = HexColor("#F5F2EB");

Color colorButtonPrimary = colorPrimary;
Color colorButtonSecondary = colorDark;
Color colorButtonThird = colorSecondary;

Color colorTextPrimary = colorDark;
Color colorTextSecondary = colorLight;

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