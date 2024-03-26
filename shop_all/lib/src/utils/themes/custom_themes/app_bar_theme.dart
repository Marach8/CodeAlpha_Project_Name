import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/font_sizes.dart';
import 'package:shop_all/src/utils/constants/font_weights.dart';

class AppAppBarTheme{
  const AppAppBarTheme._();

  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: transparentColor,
    surfaceTintColor: transparentColor,
    iconTheme: IconThemeData(
      color: blackColor,
      size: 24
    ),
    actionsIconTheme: IconThemeData(
      color: blackColor,
      size: 24
    ),
    titleTextStyle: TextStyle(
      fontSize: fontSize3half,
      fontWeight: fontWeight6,
      color: blackColor
    )
  );

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: transparentColor,
    surfaceTintColor: transparentColor,
    iconTheme: IconThemeData(
      color: blackColor,
      size: 24
    ),
    actionsIconTheme: IconThemeData(
      color: blackColor,
      size: 24
    ),
    titleTextStyle: TextStyle(
      fontSize: fontSize3half,
      fontWeight: fontWeight6,
      color: blackColor
    )
  );
}