import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/themes/custom_themes/app_bar_theme.dart';
import 'package:shop_all/src/utils/themes/custom_themes/bottom_sheet_theme.dart';
import 'package:shop_all/src/utils/themes/custom_themes/check_box_theme.dart';
import 'package:shop_all/src/utils/themes/custom_themes/chip_theme.dart';
import 'package:shop_all/src/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:shop_all/src/utils/themes/custom_themes/text_theme.dart';
import 'package:shop_all/src/utils/themes/custom_themes/textfield_theme.dart';


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
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: AppCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    inputDecorationTheme: AppTextFieldTheme.lightTextFieldTheme
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: quickSandFont,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: blackColor,
    primaryColor: blueColor,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: AppCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: AppChipTheme.darkChipTheme,
    inputDecorationTheme: AppTextFieldTheme.darkTextFieldTheme
  );
}