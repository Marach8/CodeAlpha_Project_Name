import 'package:flutter/material.dart';
import 'package:shop_haven/src/utils/constants/colors.dart';
import 'package:shop_haven/src/utils/constants/font_weights.dart';

class AppElevatedButtonTheme{
  const AppElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: whiteColor,
      backgroundColor: blueColor,
      disabledForegroundColor: greyColor,
      disabledBackgroundColor: greyColor,
      side: const BorderSide(color: blueColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        color: whiteColor,
        fontWeight: fontWeight6
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
    )
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: whiteColor,
      backgroundColor: blueColor,
      disabledForegroundColor: greyColor,
      disabledBackgroundColor: greyColor,
      side: const BorderSide(color: blueColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        color: whiteColor,
        fontWeight: fontWeight6
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
    )
  );
}