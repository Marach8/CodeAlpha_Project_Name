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
  }
}