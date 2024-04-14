import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/logo_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/container_with_border.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';

class FeaturedBrandWidget extends StatelessWidget {
  const FeaturedBrandWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainerWithBorder(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomProductImageView(
            imageString: adidasLogoString,
            height: 40,
            width: 40,
            color: isInDarkMode(context) ? whiteColor : blackColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      adidasString,
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const Icon(Iconsax.verify5, color: blueColor,)
                  ],
                ),
                Text(
                  numberOfProductsString,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}