import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';

class CustomProductCard1 extends StatelessWidget {
  const CustomProductCard1({super.key});

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);

    return Container(
      width: 180,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: inDarkMode ? blackColor : whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: inDarkMode ? whiteColor.withOpacity(0.5) : blackColor.withOpacity(0.5),
            blurRadius: 1,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: inDarkMode ? whiteColor : blackColor,
                width: 0.1
              )
            ),
            child: Stack(
              children: [
                const CustomProductImageView(imageString: airJordanShoeString),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: yellowColor.withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          '60%',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Iconsax.heart5, color: redColor)
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Nike Track suit Block',
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Text(
                  'Nike',
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Icon(Iconsax.verify5, color: blueColor)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$122.5',
                  style: Theme.of(context).textTheme.headlineMedium
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.zero,
                      topStart: Radius.circular(10),
                      bottomEnd: Radius.circular(10),
                      bottomStart: Radius.zero
                    )
                  ),
                  child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Iconsax.add),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}