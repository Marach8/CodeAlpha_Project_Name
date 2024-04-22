import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/authentication/auth_repository.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/dialogs/snackbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/success_screen.dart';

class SendAuthEmailController extends GetxController{
  static SendAuthEmailController get instance => Get.find();
  
  @override 
  void onInit(){
    super.onInit();
    sendAuthVerificationEmail();
    _timerForRedirection();
  }

  void sendAuthVerificationEmail() async{
    try{
      await AuthRepository.instance.sendAuthVerificationEmail();
      showAppSnackbar(
        title: operationSuccessfulString,
        message: verificationEmailSentString,
        backgroundColor: blueColor,
        icon: Icons.check
      );
    }
    catch(e){
      showAppSnackbar(
        title: failedOperationString,
        message: e.toString(),
        backgroundColor: redColor,
        icon: Icons.warning,
      );
    }
  }

  void _timerForRedirection() async{
    Timer.periodic(
      const Duration(seconds: 2), (timer) async{
        final user = FirebaseAuth.instance.currentUser;
        await user?.reload();
        if(user?.emailVerified ?? false){
          timer.cancel();
          Get.to(
            () => CustomSuccessScreen(
              title: successfulAccountCreationString,
              subtitle: backToLoginScreenString,
              buttonText: continueString,
              onPressed: () => AuthRepository.instance.appRedirect()
            )
          );
        }
      }
    );
  }

  void checkEmailVerificationStatus() async{
    final user = FirebaseAuth.instance.currentUser;
    if(user != null && user.emailVerified){
      Get.off(
        () => CustomSuccessScreen(
          title: successfulAccountCreationString,
          subtitle: backToLoginScreenString,
          buttonText: continueString,
          onPressed: () => AuthRepository.instance.appRedirect()
        )
      );
    }
  }
}