import 'package:campus_connect/src/utils/constants/colors.dart';
import 'package:campus_connect/src/utils/constants/fontsizes.dart';
import 'package:campus_connect/src/utils/constants/fontweights.dart';
import 'package:campus_connect/src/utils/constants/strings.dart';
import 'package:campus_connect/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:campus_connect/src/widgets/custom_widgets/elevated_button_widget.dart';
import 'package:campus_connect/src/widgets/custom_widgets/lottie_animation.dart';
import 'package:campus_connect/src/widgets/custom_widgets/rich_text_widget.dart';
import 'package:campus_connect/src/widgets/custom_widgets/text_widget.dart';
import 'package:campus_connect/src/widgets/custom_widgets/textbutton_widget.dart';
import 'package:campus_connect/src/widgets/custom_widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class SignInAndSignUpScreen extends StatefulWidget {
  const SignInAndSignUpScreen({super.key});

  @override
  State<SignInAndSignUpScreen> createState() => _SignInAndSignUpScreenState();
}

class _SignInAndSignUpScreenState extends State<SignInAndSignUpScreen> {
  late TextEditingController emailController,
  passwordController;

  @override 
  void initState(){
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override 
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return GenericAnnotatedRegion(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                spreadRadius: 5,
                color: blackColor.withOpacity(0.1)
              )
            ]
          ),
          child: Card(
            color: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            margin: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const GenericLottieAnimation(
                  lottiePath: bikeRiderLottie,
                  height: 180,
                ),
                
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                  decoration: BoxDecoration(
                    color: redColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: whiteColor,
                      width: 2,
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const GenericText(
                        fontSize: fontSize4,
                        fontWeight: fontWeight7,
                        text: welcomeBackString
                      ),
                      const GenericText(
                        fontSize: fontSize2half,
                        fontWeight: fontWeight4,
                        text: loginToAccountString
                      ),
                      const Gap(20),
                      GenericTextField(
                        hintText: enterEmailString,
                        controller: emailController
                      ),
                      const Gap(20),
                      GenericTextField(
                        hintText: enterPasswordString,
                        controller: passwordController
                      ),
                      const Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GenericTextButton(
                            onTap: (){},
                            title: rememberMeString
                          ),
                          GenericTextButton(
                            onTap: (){},
                            title: forgortPasswordString
                          )
                        ],
                      ),
                      const Gap(20),
                      GenericElevatedButton(
                        onPressed: (){},
                        title: signInString,
                        backgroundColor: redColor,
                        color: whiteColor,
                      ),
                      const Gap(40),
                      RichTextWidget(
                        children: [
                          noAccountString,
                          [
                            signUpString,
                            redColor,
                            (){}
                          ]
                        ]
                      )
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}