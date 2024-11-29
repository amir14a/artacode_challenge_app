import 'package:artacode_challenge_app/repository/colors.dart';
import 'package:flutter/material.dart';

final appLightTheme = ThemeData(
  fontFamily: 'Ubuntu',
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
  appBarTheme:
      const AppBarTheme(backgroundColor: AppColors.primaryColor, foregroundColor: AppColors.lightTextColor),
);
