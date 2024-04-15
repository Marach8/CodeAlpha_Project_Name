import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/brand_name_with_verification.dart';
import 'package:shop_all/src/widgets/custom_widgets/kite_shaped_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';
import 'package:shop_all/src/widgets/custom_widgets/rounded_edge_yellow_container.dart';

class CustomProductCard1 extends StatelessWidget {
  const CustomProductCard1({super.key});

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);

    return Container(
      width: 180,
      //margin: const EdgeInsets.all(10),
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
              color: inDarkMode ? whiteColor.withOpacity(0.1) : blackColor.withOpacity(0.07),
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
                    const RoundEdgeYellowContainer(text: '60%'),
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
          const Padding(
            padding: EdgeInsets.all(5),
            child: CustomBrandNameWithVerificationWidget(brandName: 'Nike'),
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
                const CustomKiteShapedContainerWithAddIcon(color: blueColor)
              ],
            ),
          )
        ],
      ),
    );
  }
}
