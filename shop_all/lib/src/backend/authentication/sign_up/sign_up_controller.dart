import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/backend/authentication/auth_repository.dart';
import 'package:shop_all/src/backend/network_manager/network_manager.dart';
import 'package:shop_all/src/backend/user/user_repository.dart';
import 'package:shop_all/src/models/user_model.dart';
import 'package:shop_all/src/screens/authentication/verify_email_screen.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/dialogs/loading_screen.dart';
import 'package:shop_all/src/utils/dialogs/snackbar.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  Rx<bool> showPassword = true.obs;
  Rx<bool> showConfirmPassword = true.obs;
  Rx<bool> privacyPolicyCheck = false.obs;

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
      if(!isConnected) {
        hideLoadingScreen();
        return;
      }

      if(!signUpFormKey.currentState!.validate()){
        hideLoadingScreen();
        return;
      }

      if(!(passwordController.text.trim() == confirmPasswordController.text.trim())){
        hideLoadingScreen();
        showAppSnackbar(
          title: unmatchedPasswordsString,
          message: unmatchedPasswordsSubtitleString,
          icon: Iconsax.warning_2,
          backgroundColor: redColor, 
        );
        return;
      }

      if(!privacyPolicyCheck.value){
        hideLoadingScreen();
        showAppSnackbar(
          title: acceptPrivacyPolicyString,
          message: acceptPrivacyPolicySubtitleString,
          icon: Iconsax.warning_2,
          backgroundColor: redColor, 
        );
        return;
      }

      final userCredential = await AuthRepository.instance.signUpNewUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
      );

      final userModel = UserModel(
        userId: userCredential.user!.uid,
        userName: usernameController.text.trim(),
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        displayPicture: emptyString
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserData(userModel: userModel);

      hideLoadingScreen();

      showAppSnackbar(
        title: congratulationString,
        message: successfulAccountCreationString,
        icon: Iconsax.check,
      );

      Get.to(() => VerifyEmailView(userEmail: emailController.text.trim()));

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