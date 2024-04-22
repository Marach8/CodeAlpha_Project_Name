import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/user/user_repository.dart';
import 'package:shop_all/src/models/user_model.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  Future<void> saveUserDataDuringGoogleSignIn(UserCredential? userCredential) async{
    try{
      if(userCredential != null){
        final displayName = userCredential.user?.displayName ?? emptyString;
        
        final userModel = UserModel(
          userId: userCredential.user!.uid,
          userName: displayName,
          firstName: displayName.split(emptyString).first,
          lastName: displayName.split(emptyString).last,
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
}