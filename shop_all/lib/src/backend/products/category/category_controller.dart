import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/products/category/category_repository.dart';
import 'package:shop_all/src/models/category_model.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/auth_strings.dart';
import 'package:shop_all/src/utils/dialogs/snackbar.dart';
import 'dart:developer' as marach show log;

class CategoryControler extends GetxController{
  static CategoryControler get instance => Get.find();

  final _categoryRepo = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override 
  void onInit(){
    super.onInit();
    fetchCategories();
  }


  Future<void> fetchCategories() async{
    try{
      final categories = await _categoryRepo.fetchCategoriesFromRemote();
      
      allCategories.assignAll(categories);
      
      featuredCategories.assignAll(
        allCategories.where(
          (category) => category.featured && category.parentId.isEmpty
        ).take(10).toList()
      );
    }
    catch(e){
      marach.log(e.toString());
      showAppSnackbar(
        title: errorOccuredString,
        message: e.toString(),
        icon: Icons.cancel,
        backgroundColor: redColor, 
      );
    }
  }
}