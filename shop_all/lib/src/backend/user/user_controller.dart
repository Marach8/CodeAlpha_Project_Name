import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/backend/authentication/auth_repository.dart';
import 'package:shop_all/src/backend/network_manager/network_manager.dart';
import 'package:shop_all/src/backend/user/user_repository.dart';
import 'package:shop_all/src/models/user_model.dart';
import 'package:shop_all/src/screens/authentication/re_authenticate_screen.dart';
import 'package:shop_all/src/screens/authentication/sign_in_screen.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/profile/subviews/user_profile_view.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/dialogs/loading_screen.dart';
import 'package:shop_all/src/utils/dialogs/snackbar.dart';


class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepo = Get.put(UserRepository());
  final authRepo = AuthRepository.instance;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final reAuthEmailController = TextEditingController();
  final reAuthPasswordController = TextEditingController();

  GlobalKey<FormState> updateUserFullNameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> reAuthenticateUserFormKey = GlobalKey<FormState>();

  Rx<UserModel> userModel = UserModel.empty().obs;

  @override 
  void onInit(){
    super.onInit();
    getUserDataFromRemote();
    initializeUserName();
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

  void initializeUserName() {
    firstNameController.text = userModel.value.firstName;
    lastNameController.text = userModel.value.lastName;
  }

  Future<dynamic> updateUserFullName() async{
    try{
      showLoadingScreen(signingUpString, bikeRiderLottie);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        hideLoadingScreen();
        return;
      }

      if(!reAuthenticateUserFormKey.currentState!.validate()){
        hideLoadingScreen();
        return;
      }

      final fullNameJson = {
        firstNameString.toLowerCase(): firstNameController.text.trim(),
        lastNameString.toLowerCase(): lastNameController.text.trim()
      };

      await userRepo.updateUserData(fullNameJson);
      userModel.value.firstName = firstNameController.text;
      userModel.value.lastName = lastNameController.text;

      hideLoadingScreen();

      showAppSnackbar(
        title: congratulationString,
        message: changeOfNameSuccessfulString,
        icon: Iconsax.check,
      );

      Get.off(() => const UserProfileView());
    }
    catch (e) {
      showAppSnackbar(
        title: errorOccuredString,
        message: e.toString(),
        icon: Icons.cancel,
        backgroundColor: redColor, 
      );
    }
  }


  dynamic deleteUserAccount() async{
    try{
      showLoadingScreen(deletingString, bikeRiderLottie);
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        hideLoadingScreen();
        return;
      }

      final provider = authRepo.authUser!.providerData.map((data) => data.providerId).first;
      if(provider.isNotEmpty){
        if(provider == googleDotCom){
          await authRepo.googleSignIn();
          await authRepo.deleteUserAccount();
          hideLoadingScreen();
          Get.off(() => const LoginView());
        }
        else if(provider == passwordString.toLowerCase()){
          //marach.log('I am here');
          hideLoadingScreen();
          Get.to(() => const ReAuthenticateView());
        }
      }

    }
    catch (e) {
      showAppSnackbar(
        title: errorOccuredString,
        message: e.toString(),
        icon: Icons.cancel,
        backgroundColor: redColor, 
      );
    }
  }


  dynamic reAuthenticateUser() async{
    try{
      showLoadingScreen(reAuthenticatingString, bikeRiderLottie);

      if(!reAuthenticateUserFormKey.currentState!.validate()){
        hideLoadingScreen();
        return;
      }

      await authRepo.reAuthenticateUserEmailAndPassword(
        email: reAuthEmailController.text.trim(),
        password: reAuthPasswordController.text.trim()
      );
      await authRepo.deleteUserAccount();
      
      Get.offAll(() => const LoginView());
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


  dynamic showDeleteAccountWarning(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(15),
      title: deleteAccountString,
      middleText: deleteAccountDetailsString,
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(deleteString),
        )
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.pop(Get.overlayContext!),
        child: const Text(cancelString)
      )
    );
  }
}