import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_all/src/screens/authentication/sign_in_screen.dart';
import 'package:shop_all/src/screens/authentication/verify_email_screen.dart';
import 'package:shop_all/src/screens/home_screen/main_home_screen.dart';
import 'package:shop_all/src/screens/onboarding_screen/onboarding_page_view.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';


class AuthRepository extends GetxController{
  static AuthRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _cloudAuth = FirebaseAuth.instance;

  @override 
  void onReady(){
    FlutterNativeSplash.remove();
    appRedirect();
  }

  void appRedirect() async{
    final User? user = _cloudAuth.currentUser;
    if(user != null){
      if(user.emailVerified) {
        Get.offAll(() => const MainHomeView());
      }
      else {
        Get.offAll(() => VerifyEmailView(userEmail: user.email!));
      }     
    }

    else{
      await deviceStorage.writeIfNull(isFirstTimeKey, true);
      deviceStorage.read(isFirstTimeKey) 
        ? Get.offAll(() => const OnboardingView()) 
        : Get.offAll(() => const LoginView());
    }
  }

  Future<UserCredential> signUpNewUser({
    required String email,
    required String password
  }) async{
    try{
      return await _cloudAuth.createUserWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(e){
      throw e.code;
    }
    on PlatformException catch(e){
      throw e.code;
    }
    catch(e){
      throw e.toString();
    }
  }

  Future<void> sendAuthVerificationEmail()async{
    try{
      await _cloudAuth.currentUser?.sendEmailVerification();
    }
    on FirebaseAuthException catch(e){
      throw e.code;
    }
    on PlatformException catch(e){
      throw e.code;
    }
    catch(e){
      throw e.toString();
    }
  }

  Future<void> signOutUser() async{
    try{
      await _cloudAuth.signOut();
      Get.offAll(() => const LoginView());
    }
    on FirebaseAuthException catch(e){
      throw e.code;
    }
    on PlatformException catch(e){
      throw e.code;
    }
    catch(e){
      throw e.toString();
    }
  }
}