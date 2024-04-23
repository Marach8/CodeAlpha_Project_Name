import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/backend/authentication/auth_repository.dart';
import 'package:shop_all/src/backend/network_manager/network_manager.dart';
import 'package:shop_all/src/screens/authentication/password_reset_screen.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/dialogs/loading_screen.dart';
import 'package:shop_all/src/utils/dialogs/snackbar.dart';

class ForgotPasswordController extends GetxController{
  static ForgotPasswordController get instance => Get.find();

  final emailController = TextEditingController();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  Future<void> sendUserPasswordResetEmail() async{
    try{
      showLoadingScreen(signingInString, bikeRiderLottie);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        hideLoadingScreen();
        return;
      }

      if(!emailFormKey.currentState!.validate()){
        hideLoadingScreen();
        return;
      }

      await AuthRepository.instance.sendPasswordResetEmail(email: emailController.text.trim());

      hideLoadingScreen();

      showAppSnackbar(
        title: congratulationString,
        message: resetEmailDetailsString,
        icon: Iconsax.check,
      );

      Get.to(() => PasswordResetScreen(userEmail: emailController.text.trim()));
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


  Future<void> resendUserPasswordResetEmail() async{
    try{
      
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