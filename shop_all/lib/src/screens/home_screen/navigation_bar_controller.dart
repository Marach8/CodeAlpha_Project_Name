import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

class NavigationBarController extends GetxController{
  RxInt selectedIndex = 0.obs;

  final homeViews = [
    Container(color: blueColor,),
    Container(color: redColor,),
    Container(color: Colors.yellow,),
    Container(color: Colors.green,)
  ];
}