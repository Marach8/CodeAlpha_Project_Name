import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/models/category_model.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  final _cloudDb = FirebaseFirestore.instance;
  // final _firebaseDb = FirebaseStorage.instance;

  Future<List<CategoryModel>> fetchCategoriesFromRemote() async{
    try{
      final jsonSnapshot = await _cloudDb.collection(categoriesString).get();
      final categoriesList = jsonSnapshot.docs.map((element) => CategoryModel.fromJsonSnapshot(element)).toList();
      return categoriesList;
    }
    on FirebaseAuthException catch(e){
      throw e.code;
    }
    on PlatformException catch(e){
      throw e.code;
    }
    catch(e){
      throw e.toString();
    }
  }
}