import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<void> updateUserData(Map<String, dynamic> userUpdate) async{
    try{
      await _cloudFirestore.collection(usersString).doc(_user?.uid).update(userUpdate);    
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

  Future<dynamic> deleteUserData({
    required String userId
  }) async{
    try{
      await _cloudFirestore.collection(usersString).doc(userId).delete(); 
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


  Future<String> uploadUserProfilePicture({
    required String path,
    required XFile pictureFile
  }) async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(pictureFile.name);
      await ref.putFile(File(pictureFile.path));
      final url = await ref.getDownloadURL();
      return url;
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