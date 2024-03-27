import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

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
                          Text(
                            forgotPasswordString,
                            style: Theme.of(context).textTheme.bodySmall
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