import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/models/user_model.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final cloudFirestore = FirebaseFirestore.instance;

  Future<void> saveUserData({required UserModel userModel}) async{
    try{
      await cloudFirestore.collection(usersString).doc(userModel.userId).set(userModel);
    }
    on FirebaseException catch (e){
      throw e.code;
    }
    on PlatformException catch (e){
      throw e.code;
    }
    catch (e){
      throw e.toString();
    }
  }
}