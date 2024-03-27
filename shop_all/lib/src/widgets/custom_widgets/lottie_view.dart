import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottieAnimationView extends StatelessWidget {
  final String lottieString;

  const CustomLottieAnimationView({
    super.key,
    required this.lottieString
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottieString,
      fit: BoxFit.cover,
    );
  }
}