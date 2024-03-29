import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/screens/authentication/login_screen.dart';

class OnboardingController extends GetxController{
  static OnboardingController get instance => Get.find();

  final PageController pageController = PageController();
  Rx<int> indexOfCurrentPage = 0.obs;

  void updatePageIndicator(pageIndex) => indexOfCurrentPage.value = pageIndex;

  void dotNavigatorClick(pageIndex) {
    indexOfCurrentPage.value = pageIndex;
    pageController.jumpToPage(pageIndex);
  }

  void goToNextPage() async{
    if(pageController.page == 2.0){
      await Get.offAll(const LoginView());
    }
    else{
      await pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.bounceOut
      );
    }
  }

  void skipPages() async{
    indexOfCurrentPage.value = 2;
    await pageController.animateToPage(
      2,
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate
    );
  }
}