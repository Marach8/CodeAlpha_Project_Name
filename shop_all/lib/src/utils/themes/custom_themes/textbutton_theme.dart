import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/font_sizes.dart';
import 'package:shop_all/src/utils/constants/font_weights.dart';

class AppTextButtonTheme{
  const AppTextButtonTheme._();

  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: blackColor,
      backgroundColor: transparentColor,
      disabledForegroundColor: greyColor,
      disabledBackgroundColor: greyColor,
      textStyle: const TextStyle(
        fontSize: fontSize3,
        color: blackColor,
        fontWeight: fontWeight3
      ),
    )
  );


  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: whiteColor,
      backgroundColor: transparentColor,
      disabledForegroundColor: greyColor,
      disabledBackgroundColor: greyColor,
      textStyle: const TextStyle(
        fontSize: fontSize3,
        color: blackColor,
        fontWeight: fontWeight3
      ),
    )
  );
}