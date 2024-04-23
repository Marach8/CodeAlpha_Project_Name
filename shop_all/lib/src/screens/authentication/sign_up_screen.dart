import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/authentication/sign_up/sign_up_controller.dart';
import 'package:shop_all/src/utils/constants/strings/logo_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/textformfield_validator_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/login_footer_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/rich_text_widget.dart';
import 'package:shop_all/src/widgets/custom_widgets/row_with_two_textformfields.dart';


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
                      RowWithTwoTextFormFields(
                        icon1: Icons.person_add,
                        icon2: Icons.person_add,
                        hintText1: firstNameString,
                        hintText2: lastNameString,
                        controller1: controller.firstNameController,
                        controller2: controller.lastNameController,
                        validator1: (value) => validateForm(value: value),
                        validator2: (value) => validateForm(value: value)
                      ),

                      const Gap(10),
                      TextFormField(
                        controller: controller.usernameController,
                        validator: (value) => validateForm(value: value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_add),
                          labelText: userNameString
                        ),
                      ),
                      const Gap(10),

                      TextFormField(
                        controller: controller.emailController,
                        validator: (value) => validateForm(
                          value: value,
                          specialEmailCheck: true
                        ),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_rounded),
                          labelText: emailString
                        ),
                      ),
                      const Gap(10),

                      TextFormField(
                        controller: controller.phoneNumberController,
                        validator: (value) => validateForm(
                          value: value,
                          specialPhoneNumberCheck: true
                        ),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: phoneString
                        ),
                      ),
                      const Gap(10),

                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController,
                          obscureText: controller.showPassword.value,
                          validator: (value) => validateForm(
                            value: value,
                            specialPasswordCheck: true
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                              icon: Visibility(
                                visible: controller.showPassword.value,
                                replacement: const Icon(Icons.visibility_off_rounded),
                                child: const Icon(Icons.visibility_rounded)
                              )
                            ),
                            labelText: passwordString
                          ),
                        ),
                      ),
                      const Gap(10),

                      Obx(
                        () => TextFormField(
                          controller: controller.confirmPasswordController,
                          obscureText: controller.showConfirmPassword.value,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              onPressed: () => controller.showConfirmPassword.value = !controller.showConfirmPassword.value,
                              icon: Visibility(
                                visible: controller.showConfirmPassword.value,
                                replacement: const Icon(Icons.visibility_off_rounded),
                                child: const Icon(Icons.visibility_rounded)
                              )
                            ),
                            labelText: confirmPasswordString
                          ),
                        ),
                      ),
                      
                      const Gap(10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.privacyPolicyCheck.value, 
                              onChanged: (value) => controller.privacyPolicyCheck.value = value ?? false
                            )
                          ),
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
                          onPressed: () => controller.signUpUser(),
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