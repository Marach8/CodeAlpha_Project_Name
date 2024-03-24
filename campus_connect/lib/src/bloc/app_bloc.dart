import 'package:bloc/bloc.dart';
import 'package:campus_connect/src/bloc/app_event.dart';
import 'package:campus_connect/src/bloc/app_state.dart';
import 'package:campus_connect/src/services/auth_service.dart';
import 'package:campus_connect/src/utils/constants/strings.dart';
//import 'dart:developer' as marach show log;


class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc(): super(
    InLandingScreenState()
  ){

    final authService = AuthService();
    
    on<InitializationEvent>((_, emit){
      final currentUserExist = authService.currentUser != null;
      if(currentUserExist){
        emit(InHomeScreenState());
      }
      else{
        emit(InLandingScreenState());
      }
    });

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
              operation: registeringString
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
      //At least, one field is empty
      else{
        emit(
          InSignInAndSignUpScreenState().copyState(
            showNotification: true,
            notification: emptyFieldsString
          )
        );
      }
    });

    //Sign in a user
    on<LoginUserEvent>((event, emit) async{
      final email = event.emailController.text;
      final password = event.passwordController.text;

      if(email.isNotEmpty && password.isNotEmpty){
        emit(
          InSignInAndSignUpScreenState(
            isLoading: true,
            operation: loggingInString
          )
        );
        final authResult = await authService.loginUser(
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

          emit(InHomeScreenState());
        } 
        //authentication failed.
        else{
          emit(
            InSignInAndSignUpScreenState(
              notification: authResult,
              showNotification: true
            )
          );
        }
      }

      //At least, one field is empty
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