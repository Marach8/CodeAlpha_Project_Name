import 'package:bloc/bloc.dart';
import 'package:campus_connect/src/bloc/app_event.dart';
import 'package:campus_connect/src/bloc/app_state.dart';
import 'package:campus_connect/src/services/auth_service.dart';
import 'package:campus_connect/src/utils/constants/strings.dart';
import 'dart:developer' as marach show log;


class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc(): super(
    InLandingScreenState()
  ){

    final authService = AuthService();
    
    // on<InitializationEvent>((_, emit){
    //   emit(
    //     InLandingScreenState(
    //       isLoading: true,
    //       operation: initializingString
    //     )
    //   );
    // });

    on<GoToSignInAndSignUpEvent>((_, emit){
      emit(InSignInAndSignUpScreenState());
    });

    on<GoToLandingScreenViewEvent>((_, emit){
      emit(InLandingScreenState());
    });

    //User Registration implementation
    on<RegisterNewUserEvent>((event, emit) async{
      final username = event.usernameController.text;
      final email = event.emailController.text;
      final password = event.passwordController.text;
      final confirmPassword = event.confirmPasswordController.text;

      final fieldsNotEmpty = [
        username,
        email,
        password,
        confirmPassword
      ].every((field) => field.isNotEmpty);

      if(fieldsNotEmpty){
        if(password == confirmPassword){
          emit(
            InSignInAndSignUpScreenState(
              isLoading: true,
              operation: loadingString
            )
          );
          final authResult = await authService.registerUser(
            username: username,
            email: email,
            password: password
          );
          if(authResult == authSuccessString){
            emit(
              InSignInAndSignUpScreenState(
                notification: authResult,
                showNotification: true
              )
            );
            event.controller1.reverse();
            event.controller2.reverse();
          } 
          //authentication failed.
          else{
            marach.log(authResult);
            emit(
              InSignInAndSignUpScreenState(
                notification: authResult,
                showNotification: true
              )
            );
          }
        }
        //Passwords do not match
        else{
          emit(
            InSignInAndSignUpScreenState().copyState(
              showNotification: true,
              notification: unmatchedPasswordString
            )
          );
        }
      }
      //At least, on field is empty
      else{
        emit(
          InSignInAndSignUpScreenState().copyState(
            showNotification: true,
            notification: emptyFieldsString
          )
        );
      }
    });
  }
}