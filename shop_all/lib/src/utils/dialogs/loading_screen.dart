import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/lottie_animation_view.dart';

void showLoadingScreen(String text, String lottiePath){
  showDialog(
    context: Get.overlayContext!,
    barrierDismissible: false,
    builder: (_) {
      return PopScope(
        canPop: false,
        child: Container(
          color: isInDarkMode(Get.context!) ? blackColor : whiteColor,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const Gap(250),
              CustomLottieAnimationView(lottieString: lottiePath)
            ],
          ),
        )
      );
    }

  );
}



void hideLoadingScreen() => Navigator.pop(Get.overlayContext!);