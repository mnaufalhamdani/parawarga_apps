import 'package:flutter/material.dart';
import 'package:parawarga_apps/theme/app_colors.dart';

const basePadding = 20.0;
const baseRadius = 20.0;
const baseRadiusForm = 7.0;
const baseRadiusCard = 10.0;
const basePaddingInContent = 10.0;
const baseRadiusLabel = 10.0;

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: colorBackground,
      fontFamily: 'bariol',
      appBarTheme: appBarTheme(),
      textTheme: const TextTheme(bodyMedium: TextStyle(height: 1.1))
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      backgroundColor: colorPrimary,
      elevation: 2,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
      centerTitle: true
  );
}