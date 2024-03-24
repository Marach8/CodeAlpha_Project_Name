import 'package:campus_connect/src/bloc/app_bloc.dart';
import 'package:campus_connect/src/bloc/app_state.dart';
import 'package:campus_connect/src/screens/main_screens/home_screen/main_home_screen.dart';
import 'package:campus_connect/src/screens/main_screens/landing_screen.dart';
import 'package:campus_connect/src/screens/main_screens/user_auth_screen/combination.dart';
import 'package:campus_connect/src/utils/ui_dialogs/flushbar.dart';
import 'package:campus_connect/src/utils/ui_dialogs/loading_screen/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerWidget extends StatelessWidget {
  const BlocConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context1, appState){
        
        //For Loading Screen
        final loadingScreen = LoadingScreen();
        final isLoading = appState.isLoading ?? false;
        final operation = appState.operation;
        if(isLoading && operation != null){
          WidgetsBinding.instance.addPostFrameCallback((_) {
            loadingScreen.showOverlay(
              context: context1,
              text: operation
            );
          });
        }
        else{
          loadingScreen.hideOverlay();
        }

        //For FlushBar Notifications
        final notification = appState.notification;
        final showNotification = appState.showNotification ?? false;

        if(showNotification && notification != null){
          showFlushbar(
            context: context1,
            message: appState.notification!
          );
        }
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
        else if(appState is InHomeScreenState){
          return const HomeScreen();
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