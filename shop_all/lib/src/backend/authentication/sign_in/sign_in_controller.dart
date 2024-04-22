import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/backend/authentication/auth_repository.dart';
import 'package:shop_all/src/backend/network_manager/network_manager.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/dialogs/loading_screen.dart';
import 'package:shop_all/src/utils/dialogs/snackbar.dart';

class SignInController extends GetxController{
  static SignInController get instance => Get.find();

  final _deviceStorage = GetStorage();

  Rx<bool> showPassword = true.obs;
  Rx<bool> rememberMe = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override 
  void onInit(){
    super.onInit();
    emailController.text = _deviceStorage.read(emailString) ?? emptyString;
    passwordController.text = _deviceStorage.read(passwordString) ?? emptyString;
  }

  Future<void> signInUser() async{
    try{
      showLoadingScreen(signingInString, bikeRiderLottie);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        hideLoadingScreen();
        return;
      }

      if(!signInFormKey.currentState!.validate()){
        hideLoadingScreen();
        return;
      }

      if(rememberMe.value){
        await _deviceStorage.writeIfNull(emailString, emailController.text.trim());
        await _deviceStorage.writeIfNull(passwordString, passwordController.text.trim());
      }
      else{
        await _deviceStorage.remove(emailString);
        await _deviceStorage.remove(passwordString);
      }

      await AuthRepository.instance.signInUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
      );

      hideLoadingScreen();

      showAppSnackbar(
        title: congratulationString,
        message: successfulLoginString,
        icon: Iconsax.check,
      );
      
      AuthRepository.instance.appRedirect();
    }
    catch(e){
      hideLoadingScreen();
      showAppSnackbar(
        title: errorOccuredString,
        message: e.toString(),
        icon: Icons.cancel,
        backgroundColor: redColor, 
      );
    }
  }
}