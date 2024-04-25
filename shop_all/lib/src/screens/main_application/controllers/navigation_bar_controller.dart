import 'package:get/get.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/favourites/main_favorite_view.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/home/main_home_view.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/profile/main_profile_sceen.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/store/main_store_view.dart';

class NavigationBarController extends GetxController{
  RxInt selectedIndex = 0.obs;

  final homeViews = const [
    HomeDestinationView(),
    StoreDestinationView(),
    FavoriteDestinationView(),
    ProfileDestinationView()
  ];
}