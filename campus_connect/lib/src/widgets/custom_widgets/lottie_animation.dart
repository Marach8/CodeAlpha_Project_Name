import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GenericLottieAnimation extends StatelessWidget {
  final String lottiePath;
  
  const GenericLottieAnimation({
    super.key,
    required this.lottiePath
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottiePath,
      fit: BoxFit.cover,
    );
  }
}