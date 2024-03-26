import 'package:flutter/material.dart';
import 'package:shop_haven/src/utils/constants/colors.dart';
import 'package:shop_haven/src/utils/constants/strings.dart';
import 'package:shop_haven/src/utils/themes/custom_themes/app_bar_theme.dart';
import 'package:shop_haven/src/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:shop_haven/src/utils/themes/custom_themes/text_theme.dart';

class AppTheme{
  const AppTheme._();
  
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: quickSandFont,
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColor,
    primaryColor: blueColor,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: quickSandFont,
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColor,
    primaryColor: blueColor,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme
  );
}