import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/favourites/main_favorite_view.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/home/main_home_view.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/store/main_store_view.dart';

class NavigationBarController extends GetxController{
  RxInt selectedIndex = 0.obs;

  final homeViews = [
    const HomeDestinationView(),
    const StoreDestinationView(),
    const FavoriteDestinationView(),
    Container(color: Colors.green,)
  ];
}