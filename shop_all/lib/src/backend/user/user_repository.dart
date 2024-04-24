import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/models/user_model.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final _cloudFirestore = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;

  Future<void> saveUserData({required UserModel userModel}) async{
    try{
      await _cloudFirestore.collection(usersString).doc(userModel.userId).set(userModel);
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

  Future<dynamic> retrieveUserData() async{
    try{
      final userDocumentSnapshot = await _cloudFirestore.collection(usersString).doc(_user?.uid).get();
      if(userDocumentSnapshot.exists){
        final userData = userDocumentSnapshot.data()!;
        final userModel = UserModel.fromJson(userData);
        return userModel;
      }
    }
    on FirebaseException catch(e){
      throw e.code;
    }
    on PlatformException catch(e){
      throw e.code;
    }
    catch (e){
      throw e.toString();
    }
  }

  Future<void> updateUserData(UserModel userModel) async{
    try{
      await _cloudFirestore.collection(usersString).doc(_user?.uid).update(userModel);    
    }
    on FirebaseException catch(e){
      throw e.code;
    }
    on PlatformException catch(e){
      throw e.code;
    }
    catch (e){
      throw e.toString();
    }
  }

  Future<dynamic> deleteUserData(UserModel userModel) async{
    try{
      await _cloudFirestore.collection(usersString).doc(_user?.uid).delete();    
    }
    on FirebaseException catch(e){
      throw e.code;
    }
    on PlatformException catch(e){
      throw e.code;
    }
    catch (e){
      throw e.toString();
    }
  }
}