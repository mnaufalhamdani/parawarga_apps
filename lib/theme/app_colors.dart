import 'package:flutter/material.dart';

Color colorPrimary = HexColor("#11998E");
Color colorSecondary = HexColor("#FDC827");
Color colorDark = HexColor("#04454D");
Color colorLight = HexColor("#DAFFFC");
Color colorBackground = HexColor("#f7f9fa");

Color colorButtonPrimary = colorPrimary;
Color colorButtonSecondary = colorDark;
Color colorButtonThird = colorSecondary;

// Color colorTextPrimary = HexColor("#484848");
Color colorTextPrimary = colorDark;
Color? colorTextSecondary = Colors.grey.shade700;
Color? colorTextThird = colorLight;

Color? colorTextTitle = HexColor("#282a2e");
Color? colorTextlabel = HexColor("#afb1b5");
Color? colorTextMessage = Colors.grey.shade700;

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