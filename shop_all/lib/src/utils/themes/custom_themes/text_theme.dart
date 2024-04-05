import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/font_sizes.dart';
import 'package:shop_all/src/utils/constants/font_weights.dart';

class AppTextTheme{
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: fontSize6half,
      fontWeight: fontWeightBold,
      color: blackColor
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: fontSize4half,
      fontWeight: fontWeight7,
      color: blackColor
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: fontSize3half,
      fontWeight: fontWeight6,
      color: blackColor
    ),

    titleLarge: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeightBold,
      color: blackColor
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeight5,
      color: blackColor
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeight4,
      color: blackColor
    ),

    bodyLarge: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeight5,
      color: blackColor
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeightNormal,
      color: blackColor
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeight5,
      color: blackColor.withOpacity(0.5)
    ),

    labelLarge: const TextStyle().copyWith(
      fontSize: fontSize2half,
      fontWeight: fontWeightNormal,
      color: blackColor
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: fontSize2half,
      fontWeight: fontWeightNormal,
      color: blackColor
    ),
  );


  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: fontSize6half,
      fontWeight: fontWeightBold,
      color: whiteColor
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: fontSize4half,
      fontWeight: fontWeight7,
      color: whiteColor
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: fontSize3half,
      fontWeight: fontWeight6,
      color: whiteColor
    ),

    titleLarge: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeightBold,
      color: whiteColor
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeight5,
      color: whiteColor
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeight4,
      color: whiteColor
    ),

    bodyLarge: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeight5,
      color: whiteColor
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeightNormal,
      color: whiteColor
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: fontSize3,
      fontWeight: fontWeight5,
      color: whiteColor.withOpacity(0.5)
    ),

    labelLarge: const TextStyle().copyWith(
      fontSize: fontSize2half,
      fontWeight: fontWeightNormal,
      color: whiteColor
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: fontSize2half,
      fontWeight: fontWeightNormal,
      color: whiteColor
    ),
  );  
}