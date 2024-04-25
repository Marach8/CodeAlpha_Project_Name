import 'package:get/get.dart';

class CarouselIndicatorController extends GetxController{

  static CarouselIndicatorController get instance => Get.find();
  RxInt carouselIndex = 0.obs;

  void updateIndicator(index) => carouselIndex.value = index;
}