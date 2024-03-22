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
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const GenericLottieAnimation(lottiePath: bikeRiderLottie),
              const Gap(10),
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
              GenericTextField(
                hintText: enterPasswordString,
                controller: passwordController
              ),
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
                noMargin: true,
              ),
              const Gap(20),
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
            ]
          ),
        ),
      ),
    );
  }
}