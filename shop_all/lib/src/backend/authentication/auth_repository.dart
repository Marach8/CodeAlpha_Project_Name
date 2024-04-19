
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_all/src/screens/authentication/sign_in_screen.dart';
import 'package:shop_all/src/screens/onboarding_screen/onboarding_page_view.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';

class AuthRepository extends GetxController{
  static AuthRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override 
  void onReady(){
    FlutterNativeSplash.remove();
    appRedirect();
  }

  appRedirect() async{
    await deviceStorage.writeIfNull(isFirstTimeKey, true);
    deviceStorage.read(isFirstTimeKey) 
      ? Get.offAll(() => const OnboardingView()) 
      : Get.offAll(() => const LoginView());
  }
}