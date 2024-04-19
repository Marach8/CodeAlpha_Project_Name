import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/screens/authentication/sign_up_screen.dart';
import 'package:shop_all/src/screens/authentication/password_reset_screen.dart';
import 'package:shop_all/src/screens/home_screen/main_home_screen.dart';
import 'package:shop_all/src/utils/constants/strings/logo_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/login_footer_container.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: emailString
                        ),
                      ),
                      const Gap(20),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: Icon(Icons.visibility),
                          labelText: passwordString
                        ),
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(value: true, onChanged: (value){}),
                              Text(
                                rememberMeString,
                                style: Theme.of(context).textTheme.bodySmall
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () => Get.to(() => const PasswordResetView()),
                            child: const Text(forgotPasswordString),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            Get.offAll(() => const MainHomeView());
                          },
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
          ),
        ),
      ),
    );
  }
}