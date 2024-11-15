import 'package:flutter/material.dart';
import 'package:parawarga_apps/theme/app_colors.dart';

const basePadding = 20.0;
const baseRadius = 20.0;
const baseRadiusForm = 7.0;

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'bariol',
      appBarTheme: appBarTheme(),
      textTheme: const TextTheme(bodyMedium: TextStyle(height: 1))
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      backgroundColor: colorPrimary,
      elevation: 2,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      centerTitle: true
  );
}