import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/models/banner_model.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  final _cloudDb = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBannersFromRemote() async{
    try{
      final query = await _cloudDb.collection('Banners')
        .where('isActive', isEqualTo: true)
        .get();
      
      final listOfBanners = query.docs.map(
        (queryDocument) => BannerModel.fromJsonSnapshot(jsonSnapshot: queryDocument)
      ).toList();

      return listOfBanners;
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