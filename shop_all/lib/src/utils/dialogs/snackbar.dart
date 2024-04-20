import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

void showAppSnackbar({
  required String title,
  required String message,
  IconData? icon,
  Color? color
}){
  Get.snackbar(
    title,
    message,
    isDismissible: true,
    shouldIconPulse: true ,
    colorText: whiteColor,
    backgroundColor: blueColor,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(20),
    icon: Icon(icon, color: color)
  );
}