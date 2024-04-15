import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/home/home_subviews/cart_view.dart';

class ShopItemsNotification extends StatelessWidget {
  const ShopItemsNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const CartView()),
      child: Stack(
        children: [
          const Icon(Iconsax.shopping_bag),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 15,
              width: 15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: redColor
              ),
              child: Text(
                '6',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}