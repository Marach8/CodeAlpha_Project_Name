import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';

class ProductDetailsBottomNavBarWidget extends StatelessWidget {
  const ProductDetailsBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const CustomCircularContainer(
            color: greyColor,
            radius: 35,
            child: Icon(Icons.remove),
          ),
          const Text('2'),
          CustomCircularContainer(
            color: whiteColor.withOpacity(0.2),
            radius: 35,
            child: const Icon(Icons.add),
          ),
          const Spacer(),
          Expanded(
            child: ElevatedButton(
              onPressed: (){},
              child: const Text('Add to cart'),
            ),
          )
        ]
      ),
    );
  }
}