import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/dialogs/snackbar.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();

  final _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus = ConnectivityResult.none.obs;

  @override 
  void onInit() {
    super.onInit();
    _ConnectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnnectionStatus);
  }

  void _updateConnnectionStatus(ConnectivityResult result){
    _connectivityStatus.value =  result;
    if(_connectivityStatus.value == ConnectivityResult.none){
      showAppSnackbar(
        title: 'No Internet Connection!...',
        message: '',
        icon: Iconsax.warning_2,
        color: redColor
      );
    }
  }

  Future<bool> isConnected() async{
    try{
      final result = await _connectivity.checkConnectivity();
      if(result == ConnectivityResult.none){
        return false;
      }
      else{
        return true;
      }
    }
    on PlatformException catch(_){
      return false;
    }
  }

  @override 
  void onClose(){
    _connectivitySubscription.cancel();
    super.onClose();
  }
}