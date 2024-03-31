import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/screens/home_screen/navigation_bar_controller.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/annotated_region.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationBarController());
    final inDarkMode = isInDarkMode(context);

    return Obx(
      () => GenericAnnotatedRegion(
        child: Scaffold(
          bottomNavigationBar: NavigationBar(
            backgroundColor: inDarkMode ? blackColor : whiteColor,
            elevation: 0,
            height: 65,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Iconsax.home1),
                icon: Icon(Iconsax.home), 
                label: homeString,
              ),
              NavigationDestination(
                selectedIcon: Icon(Iconsax.shop5),
                icon: Icon(Iconsax.shop),
                label: storeString
              ),
              NavigationDestination(
                selectedIcon: Icon(Iconsax.heart5),
                icon: Icon(Iconsax.heart),
                label: favouritesString
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Iconsax.user),
                label: profileString
              )
            ],
          ),
          body: controller.homeViews[controller.selectedIndex.value]
        ),
      ),
    );
  }
}
