import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/dialogs/loading_screen.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final usernameController = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  Future<void> signUpUser() async{
    showLoadingScreen('Registration information processing...', bikeRiderLottie);
  }
}