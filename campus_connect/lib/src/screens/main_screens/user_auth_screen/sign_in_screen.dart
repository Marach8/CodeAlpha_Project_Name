import 'package:campus_connect/src/bloc/app_bloc.dart';
import 'package:campus_connect/src/bloc/app_event.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SignInScreen extends StatefulWidget {
  final AnimationController controller1, controller2;

  const SignInScreen({
    super.key,
    required this.controller1,
    required this.controller2
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailController,
  passwordController;
  late ValueNotifier<bool> passwordNotifier, 
  confirmPasswordNotifier;

  @override 
  void initState(){
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordNotifier = ValueNotifier(false);
    confirmPasswordNotifier = ValueNotifier(false);
  }

  @override 
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    passwordNotifier.dispose();
    confirmPasswordNotifier.dispose();
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
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: (){
                            context.read<AppBloc>().add(
                              const GoToLandingScreenViewEvent()
                            );
                          },
                          child: const Icon(Icons.keyboard_arrow_left_sharp),
                        ),
                      ),
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
                        hintText: emailString,
                        controller: emailController,
                        leadingWidget: const Icon(Icons.email_outlined),
                      ),
                      const Gap(20),
                      ValueListenableBuilder(
                        valueListenable: passwordNotifier,
                        builder: (_, value, __){
                          return GenericTextField(
                            hintText: passwordString,
                            controller: passwordController,
                            leadingWidget: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              onPressed: () => passwordNotifier.value = !passwordNotifier.value,
                              icon: Visibility(
                                visible: value,
                                replacement: const Icon(Icons.visibility_rounded),
                                child: const Icon(Icons.visibility_off_rounded),
                              ),
                            ),
                            obscureText: value ? false : true,
                          );
                        },
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
                        onPressed: (){
                          context.read<AppBloc>().add(
                            LoginUserEvent(
                              emailController: emailController,
                              passwordController: passwordController
                            )
                          );
                        },
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
                            (){
                              widget.controller1.forward();
                              widget.controller2.forward();
                            }
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