import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/network_manager/network_manager.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/dialogs/loading_screen.dart';
import 'package:shop_all/src/utils/dialogs/snackbar.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  Rx<bool> showPassword = true.obs;
  Rx<bool> showConfirmPassword = true.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final usernameController = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  Future<void> signUpUser() async{
    try{
      showLoadingScreen(signingUpString, bikeRiderLottie);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      if(!signUpFormKey.currentState!.validate()) return;
    }
    catch(e){
      showAppSnackbar(
        title: errorOccuredString,
        message: e.toString()
      );
    }
    finally{
      hideLoadingScreen();
    }
  }
}