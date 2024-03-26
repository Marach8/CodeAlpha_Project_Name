import 'package:flutter/material.dart';
import 'package:shop_haven/src/utils/constants/colors.dart';
import 'package:shop_haven/src/utils/constants/font_sizes.dart';

class AppTextFieldTheme{
  const AppTextFieldTheme._();

  static InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: greyColor,
    suffixIconColor: greyColor,
    labelStyle: const TextStyle().copyWith(fontSize: fontSize3, color: blackColor),
    hintStyle: const TextStyle().copyWith(fontSize: fontSize3, color: blackColor),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: blueColor.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: greyColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: greyColor),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: blackColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: redColor),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1.5, color: orangeColor),
    )
  );


  static InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: greyColor,
    suffixIconColor: greyColor,
    labelStyle: const TextStyle().copyWith(fontSize: fontSize3, color: whiteColor),
    hintStyle: const TextStyle().copyWith(fontSize: fontSize3, color: whiteColor),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: blueColor.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: greyColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: greyColor),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: whiteColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: redColor),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1.5, color: orangeColor),
    )
  );
}