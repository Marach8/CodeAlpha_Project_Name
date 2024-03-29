import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/font_sizes.dart';
import 'package:shop_all/src/utils/constants/font_weights.dart';

class AppOutlinedButtonTheme{
  const AppOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: blackColor,
      backgroundColor: transparentColor,
      disabledForegroundColor: greyColor,
      disabledBackgroundColor: greyColor,
      side: const BorderSide(color: blackColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: fontSize3,
        color: blackColor,
        fontWeight: fontWeight6
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
    )
  );

  static OutlinedButtonThemeData darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: whiteColor,
      backgroundColor: transparentColor,
      disabledForegroundColor: greyColor,
      disabledBackgroundColor: greyColor,
      side: const BorderSide(color: whiteColor),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: fontSize3,
        color: whiteColor,
        fontWeight: fontWeight6
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
    )
  );
}