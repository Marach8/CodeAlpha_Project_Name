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
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final RxList<ConnectivityResult> _connectivityStatus = [ConnectivityResult.none].obs;

  @override 
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result){
    _connectivityStatus.value =  result;
    if(result.contains(ConnectivityResult.none)){
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
      return !result.contains(ConnectivityResult.none);
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