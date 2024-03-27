import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/screens/onboarding_screen/custom_onboarding.dart';
import 'package:shop_all/src/screens/onboarding_screen/onboarding_controller.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: (pageIndex) => controller.updatePageIndicator,
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
          ),

          Positioned(
            top: kToolbarHeight,
            right: 10.0,
            child: TextButton(
              child: Text(
                skipString,
                style: Theme.of(context).textTheme.bodySmall
              ),
              onPressed: () => controller.skipPages(),
            ),
          ),
          Positioned(
            bottom: kBottomNavigationBarHeight,
            left: 10,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              onDotClicked: controller.dotNavigatorClick,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: inDarkMode ? whiteColor :blackColor,
                dotHeight: 6
              ),
            ),
          ),
          Positioned(
            bottom: kBottomNavigationBarHeight,
            right: 10,
            child: ElevatedButton(
              onPressed: () => controller.goToNextPage(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: !inDarkMode ? blackColor : null
              ),
              child: const Icon(Icons.arrow_forward_ios_rounded)
            ),
          )
        ],
      )
    );
  }
}