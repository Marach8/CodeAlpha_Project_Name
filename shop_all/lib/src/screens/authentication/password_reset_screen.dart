import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/screens/authentication/sign_in_screen.dart';
import 'package:shop_all/src/screens/authentication/verify_email_screen.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class PasswordResetView extends StatelessWidget {
  const PasswordResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.keyboard_backspace_outlined),
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                forgotPasswordString,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Gap(10),
              Text(
                forgotPasswordDetailsString,
                style: Theme.of(context).textTheme.bodyMedium
              ),
              const Gap(20),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: emailString
                ),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  // onPressed: () => Get.to(
                  //   () => SendAuthEmailView(
                  //     userEmail: emptyString,
                  //     title: resetEmailSentString,
                  //     subtitle: resetEmailDetailsString,
                  //     buttonOnPressed: () => Get.offAll(() => const LoginView()),
                  //     resendEmailTap: (){},
                  //     buttonText: continueString
                  //   ),
                  // ),
                  child: const Text(submitString),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}