import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/backend/authentication/auth_repository.dart';
import 'package:shop_all/src/backend/network_manager/network_manager.dart';
import 'package:shop_all/src/backend/user/user_repository.dart';
import 'package:shop_all/src/models/user_model.dart';
import 'package:shop_all/src/screens/authentication/send_auth_email_screen.dart';
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
      if(!isConnected) return;

      if(!signUpFormKey.currentState!.validate()) return;

      if(!(passwordController.text.trim() == confirmPasswordController.text.trim())){
        showAppSnackbar(
          title: unmatchedPasswordsString,
          message: unmatchedPasswordsSubtitleString,
          icon: Iconsax.warning_2,
          backgroundColor: redColor, 
        );
        return;
      }

      if(!privacyPolicyCheck.value){
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
        title: emptyString,
        message: successfulAccountCreationString,
        icon: Iconsax.check,
        backgroundColor: blueColor,
        duration: 3
      );
      Get.to(
        () => SendAuthEmailView(
          title: verifyEmailString,
          subtitle: verifyEmailDetailsString,
          buttonText: continueString,
          buttonOnPressed: (){},
          resendEmailTap: (){},
          // buttonOnPressed: () => Get.to(
          //   () => CustomSuccessScreen(
          //     title: successfulAccountCreationString,
          //     subtitle: backToLoginScreenString,
          //     buttonText: continueString,
          //     onPressed: () => Get.offAll(
          //       () => const LoginView()
          //     )
          //   )
          // ),
        )
      );

    }
    catch(e){
      showAppSnackbar(
        title: errorOccuredString,
        message: e.toString(),
        icon: Icons.cancel,
        backgroundColor: redColor, 
      );
    }
    finally{
      hideLoadingScreen();
    }
  }
}