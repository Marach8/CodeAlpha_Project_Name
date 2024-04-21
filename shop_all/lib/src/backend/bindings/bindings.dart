import 'package:get/get.dart';
import 'package:shop_all/src/backend/network_manager/network_manager.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }

}