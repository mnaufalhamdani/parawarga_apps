import 'package:flutter/material.dart';
import 'package:parawarga_apps/theme/app_colors.dart';

const baseRadius = 20.0;

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'bariol',
      appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 2,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: colorTextPrimary, fontSize: 18),
      centerTitle: true
  );
}