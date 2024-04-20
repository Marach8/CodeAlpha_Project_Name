import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/lottie_animation_view.dart';

class CustomUserDisplayPicture extends StatelessWidget {
  final double radius;
  const CustomUserDisplayPicture({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CustomCircularContainer(
      radius: radius,
      child: const CustomLottieAnimationView(lottieString: lottie7,),
    );
  }
}