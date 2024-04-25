import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/widgets/custom_widgets/lottie_animation_view.dart';

class CustomOnboardingView extends StatelessWidget {
  final String lottieString, 
  welcomeTitle, welcomeSubtitle;

  const CustomOnboardingView({
    super.key,
    required this.welcomeSubtitle,
    required this.welcomeTitle,
    required this.lottieString
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLottieAnimationView(lottieString: lottieString),
            const Gap(50),
            Text(
              welcomeTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(10),
            Text(
              welcomeSubtitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}