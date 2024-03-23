import 'package:flutter/material.dart';

@immutable 
abstract class AppEvent{
  const AppEvent();
}


@immutable 
class InitializationEvent extends AppEvent{
  const InitializationEvent();
}

@immutable 
class GoToSignInAndSignUpEvent extends AppEvent{
  const GoToSignInAndSignUpEvent();
}

@immutable 
class GoToHomeScreenEvent extends AppEvent{
  const GoToHomeScreenEvent();
}

@immutable 
class GoToLandingScreenViewEvent extends AppEvent{
  const GoToLandingScreenViewEvent();
}

@immutable 
class RegisterNewUserEvent extends AppEvent{
  final TextEditingController usernameController,
  emailController, passwordController,
  confirmPasswordController;

  const RegisterNewUserEvent({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController
  });
}