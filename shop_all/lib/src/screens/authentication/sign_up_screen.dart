import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/authentication/sign_up/sign_up_controller.dart';
import 'package:shop_all/src/screens/authentication/sign_in_screen.dart';
import 'package:shop_all/src/screens/authentication/send_auth_email_screen.dart';
import 'package:shop_all/src/utils/constants/strings/logo_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/login_footer_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/rich_text_widget.dart';
import 'package:shop_all/src/widgets/custom_widgets/row_with_two_textformfields.dart';
import 'package:shop_all/src/widgets/custom_widgets/success_screen.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          createAccountString,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.keyboard_backspace_outlined),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: controller.signUpFormKey,
                  child: Column(
                    children: [
                      const RowWithTwoTextFormFields(
                        icon1: Icons.person_add,
                        icon2: Icons.person_add,
                        hintText1: firstNameString,
                        hintText2: lastNameString,
                      ),

                      const Gap(10),
                      TextFormField(
                        controller: controller.usernameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_add),
                          labelText: userNameString
                        ),
                      ),
                      const Gap(10),

                      TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_rounded),
                          labelText: emailString
                        ),
                      ),
                      const Gap(10),

                      TextFormField(
                        controller: controller.phoneNumberController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: phoneString
                        ),
                      ),
                      const Gap(10),

                      TextFormField(
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: Icon(Icons.visibility),
                          labelText: passwordString
                        ),
                      ),
                      const Gap(10),

                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: Icon(Icons.visibility),
                          labelText: confirmPasswordString
                        ),
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(value: true, onChanged: (value){}),
                          Expanded(
                            child: RichTextWidget(
                              children: [
                                agreeString,
                                [
                                  privacyPolicyString,
                                  (){}
                                ],
                                andString,
                                [
                                  termsOfServiceString,
                                  (){}
                                ]
                              ],
                            ),
                          )
                        ],
                      ),
                      const Gap(20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Get.to(
                            () => SendAuthEmailView(
                              title: verifyEmailString,
                              subtitle: verifyEmailDetailsString,
                              buttonText: continueString,
                              buttonOnPressed: () => Get.to(
                                () => CustomSuccessScreen(
                                  title: successfulAccountCreationString,
                                  subtitle: backToLoginScreenString,
                                  buttonText: continueString,
                                  onPressed: () => Get.offAll(
                                    () => const LoginView()
                                  )
                                )
                              ),
                              resendEmailTap: (){},
                            )
                          ),
                          child: const Text(signUpString),
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
                            onPressed: (){},
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}