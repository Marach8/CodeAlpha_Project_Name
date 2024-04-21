import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/authentication/email_verification/verify_email_controller.dart';
import 'package:shop_all/src/screens/authentication/sign_in_screen.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/lottie_animation_view.dart';

class SendAuthEmailView extends StatelessWidget {
  final String title, subtitle,
  buttonText, userEmail;
  final void Function() buttonOnPressed,
  resendEmailTap;

  const SendAuthEmailView({
    super.key,
    required this.title,
    required this.userEmail,
    required this.subtitle,
    required this.buttonOnPressed,
    required this.resendEmailTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SendAuthEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const Gap(10),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: Text(buttonText),
                  ),
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => controller.sendAuthVerificationEmail(),
                    child: Text(
                      resendEmailString,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
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