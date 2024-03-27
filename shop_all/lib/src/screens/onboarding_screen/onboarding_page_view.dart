import 'package:flutter/material.dart';
import 'package:shop_all/src/screens/onboarding_screen/custom_onboarding.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: const[
              CustomOnboardingView(
                welcomeTitle: welcomeTitle1,
                welcomeSubtitle: welcomeSubtitle1,
                lottieString: lottie1
              ),
              CustomOnboardingView(
                welcomeTitle: welcomeTitle2,
                welcomeSubtitle: welcomeSubtitle2,
                lottieString: lottie2
              ),
              CustomOnboardingView(
                welcomeTitle: welcomeTitle3,
                welcomeSubtitle: welcomeSubtitle3,
                lottieString: lottie3
              ),
            ],
          )
        ],
      )
    );
  }
}