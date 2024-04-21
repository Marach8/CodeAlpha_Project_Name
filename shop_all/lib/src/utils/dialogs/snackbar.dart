import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

void showAppSnackbar({
  required String title,
  required String message,
  IconData icon = Iconsax.user,
  Color iconColor = whiteColor,
  int duration = 5,
  Color backgroundColor = blueColor
}){
  Get.snackbar(
    title,
    message,
    isDismissible: true,
    shouldIconPulse: true ,
    colorText: whiteColor,
    backgroundColor: backgroundColor,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: duration),
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
    icon: Icon(icon, color: iconColor, size: 25,)
  );
}