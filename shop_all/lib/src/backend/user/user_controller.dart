import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/user/user_repository.dart';
import 'package:shop_all/src/models/user_model.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/dialogs/snackbar.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepo = Get.put(UserRepository());

  Rx<UserModel> userModel = UserModel.empty().obs;

  @override 
  void onInit(){
    super.onInit();
    getUserDataFromRemote();
  }

  Future<void> saveUserDataDuringGoogleSignIn(UserCredential? userCredential) async{
    try{
      if(userCredential != null){
        final displayName = userCredential.user?.displayName ?? emptyString;
        
        final userModel = UserModel(
          userId: userCredential.user!.uid,
          userName: displayName,
          firstName: displayName.split(spaceString).first,
          lastName: displayName.split(spaceString).last,
          email: userCredential.user!.email ?? emptyString,
          phoneNumber: userCredential.user!.phoneNumber ?? emptyString,
          displayPicture: userCredential.user!.photoURL ?? emptyString
        );

        final userRepo = Get.put(UserRepository());
        await userRepo.saveUserData(userModel: userModel);
      }
    }
    catch(e){
      throw e.toString();
    }
  }


  Future<dynamic> getUserDataFromRemote() async{
    try{
      final userModelFromRemote = await userRepo.retrieveUserData();
      userModel(userModelFromRemote);
    }
    catch (e){
      showAppSnackbar(
        title: errorOccuredString,
        message: e.toString(),
        icon: Icons.cancel,
        backgroundColor: redColor, 
      );
    }
  }
}