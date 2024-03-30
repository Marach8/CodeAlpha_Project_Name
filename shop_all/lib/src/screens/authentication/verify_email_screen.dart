import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/screens/authentication/login_screen.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/lottie_view.dart';

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
      
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomLottieAnimationView(lottieString: lottie4)
              ],
            ),
          ),
        ),
      )
    );
  }
}