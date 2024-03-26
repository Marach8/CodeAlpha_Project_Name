import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

class AppChipTheme{
  const AppChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: greyColor.withOpacity(0.5),
    labelStyle: const TextStyle(color: blackColor),
    selectedColor: blueColor,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: whiteColor
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: greyColor.withOpacity(0.5),
    labelStyle: const TextStyle(color: whiteColor),
    selectedColor: blueColor,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: whiteColor
  );
}