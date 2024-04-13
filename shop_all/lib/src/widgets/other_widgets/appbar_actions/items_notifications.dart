import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/widgets/other_widgets/cart_view.dart';

class ShopItemsNotification extends StatelessWidget {
  const ShopItemsNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartView()),
          icon: const Icon(Iconsax.shopping_bag)
        ),
        Positioned(
          right: 5,
          top: 5,
          child: Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: redColor
            ),
            child: Text(
              '6',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        )
      ],
    );
  }
}