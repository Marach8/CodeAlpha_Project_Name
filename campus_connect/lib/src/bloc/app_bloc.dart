import 'package:bloc/bloc.dart';
import 'package:campus_connect/src/bloc/app_event.dart';
import 'package:campus_connect/src/bloc/app_state.dart';
import 'package:campus_connect/src/utils/constants/strings.dart';


class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc(): super(
    InLandingScreenState()
  ){
    
    on<InitializationEvent>((_, emit){
      emit(
        InLandingScreenState(
          isLoading: true,
          operation: initializingString
        )
      );
    });

    on<GoToSignInAndSignUpEvent>((_, emit){
      emit(InSignInAndSignUpScreenState());
    });

    on<GoToLandingScreenViewEvent>((_, emit){
      emit(InLandingScreenState());
    });

    //User Registration implementation
    on<RegisterNewUserEvent>((event, emit) async{
      final fieldsNotEmpty = [
        event.usernameController,
        event.emailController,
        event.passwordController,
        event.confirmPasswordController
      ].every((controller) => controller.text.isNotEmpty);

      if(fieldsNotEmpty){
        if(event.passwordController.text == event.confirmPasswordController.text){
          emit(
            InSignInAndSignUpScreenState().copyState(
              isLoading: true,
              operation: loadingString
            )
          );
        }
        else{
          emit(
            InSignInAndSignUpScreenState().copyState(
              showNotification: true,
              notification: unmatchedPasswordString
            )
          );
        }
      }

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