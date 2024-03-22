import 'package:campus_connect/src/bloc/app_bloc.dart';
import 'package:campus_connect/src/bloc/app_state.dart';
import 'package:campus_connect/src/screens/main_screens/landing_screen.dart';
import 'package:campus_connect/src/screens/main_screens/user_auth_screen/combination.dart';
import 'package:campus_connect/src/screens/main_screens/user_auth_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerWidget extends StatelessWidget {
  const BlocConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context1, appState){

      },

      listenWhen: (initialState, finalState) 
        => initialState != finalState,

      builder: (_, appState){
        if(appState is InSignInAndSignUpScreenState){
          return const SignInAndSignUpScreen();
        }
        else if(appState is InLandingScreenState){
          return const LandingPageScreen();
        }
        //This should never happen
        else{
          return const SizedBox.shrink();
        }
      },
      
      buildWhen: (initialState, finalState) 
        => initialState != finalState,
    );
  }
}