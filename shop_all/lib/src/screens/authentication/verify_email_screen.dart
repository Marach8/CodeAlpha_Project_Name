import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/screens/authentication/login_screen.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/lottie_view.dart';
import 'package:shop_all/src/widgets/custom_widgets/success_screen.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () => Get.back(),
        //   icon: const Icon(Icons.keyboard_backspace_outlined),
        // ),
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginView()),
            icon: const Icon(Icons.cancel)
          )
        ]
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomLottieAnimationView(lottieString: lottie4),
                Text(
                  verifyEmailString,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(
                      () => CustomSuccessScreen(
                        buttonText: continueString,
                        title: successfulAccountCreationString,
                        subtitle: backToLoginScreenString,
                        onPressed: () => Get.offAll(() => const LoginView()),
                      )
                    ),
                    child: const Text(continueString),
                  ),
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: (){},
                    child: const Text(resendEmailString),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}