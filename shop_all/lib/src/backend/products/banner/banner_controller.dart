import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/products/banner/banner_repository.dart';
import 'package:shop_all/src/models/banner_model.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';
import 'package:shop_all/src/utils/dialogs/snackbar.dart';

class BannerController extends GetxController{

  static BannerController get instance => Get.find();

  RxInt carouselIndex = 0.obs;
  final _bannerRepo = Get.put(BannerRepository());
  
  RxList<BannerModel> banners = <BannerModel>[].obs;

  @override 
  void onInit(){
    super.onInit();
    fetchBanners();
  }

  void updateIndicator(index) => carouselIndex.value = index;
  


  Future<void> fetchBanners() async{
    try{
      final listOfBanners = await _bannerRepo.fetchBannersFromRemote();
      banners.assignAll(listOfBanners);
    }
    catch(e){
      showAppSnackbar(
        title: errorOccuredString,
        message: e.toString(),
        icon: Icons.cancel,
        backgroundColor: redColor, 
      );
    }
  }
}