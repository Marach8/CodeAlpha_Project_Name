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
class GoToLandingScreenView extends AppEvent{
  const GoToLandingScreenView();
}
