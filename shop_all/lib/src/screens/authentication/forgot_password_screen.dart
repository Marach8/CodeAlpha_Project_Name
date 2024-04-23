import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/authentication/forgot_pasword/forgot_password_controller.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());

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
              Form(
                key: controller.emailFormKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: emailString
                  ),
                ),
              ),
              const Gap(20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async => await controller.sendUserPasswordResetEmail(),
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