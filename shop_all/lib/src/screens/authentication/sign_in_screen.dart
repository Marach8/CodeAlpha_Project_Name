import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/authentication/sign_in/sign_in_controller.dart';
import 'package:shop_all/src/screens/authentication/sign_up_screen.dart';
import 'package:shop_all/src/screens/authentication/password_reset_screen.dart';
import 'package:shop_all/src/utils/constants/strings/logo_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/textformfield_validator_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/login_footer_container.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  welcomeBackString,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Gap(10),
                Text(
                  introString,
                  style: Theme.of(context).textTheme.bodySmall
                ),
                const Gap(20),

                Form(
                  key: controller.signInFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        validator: (value) => validateForm(
                          value: value,
                          specialEmailCheck: true
                        ),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: emailString
                        ),
                      ),

                      const Gap(20),

                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          validator: (value) => validateForm(value: value),
                          obscureText: controller.showPassword.value,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                              icon: Visibility(
                                visible: controller.showPassword.value,
                                replacement: const Icon(Icons.visibility_off_rounded),
                                child: const Icon(Icons.visibility_rounded)
                              ),
                            ),
                            labelText: passwordString
                          ),
                        ),
                      ),
                      const Gap(10),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.rememberMe.value,
                              onChanged: (value) => controller.rememberMe.value = value ?? false,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.rememberMe.value = !controller.rememberMe.value,
                            child: Text(
                              rememberMeString,
                              style: Theme.of(context).textTheme.bodyLarge
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () => Get.to(() => const PasswordResetView()),
                            child: Text(
                              forgotPasswordString,
                              style: Theme.of(context).textTheme.bodyLarge
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async => await controller.signInUser(),
                          child: const Text(loginString),
                        ),
                      ),
                      const Gap(20),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: ()  => Get.to(() => const CreateAccountView()),
                          child: const Text(signUpString),
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(40),
                Row(
                  children: [
                    const Expanded(child: Divider(indent: 20,)),
                    Text(
                      orSignUpWithString,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const Expanded(child: Divider(endIndent: 20,))
                  ]
                ),

                const Gap(35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FooterContainer(
                      logoString: googleLogoString,
                      onPressed: () => controller.signInUserWithGoogle(),
                    ),
                    const Gap(20),
                    FooterContainer(
                      logoString: facebookLogoString,
                      onPressed: (){}
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}