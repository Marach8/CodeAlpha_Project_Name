import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/logo_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';

class FeaturedBrandsSubView extends StatelessWidget {
  const FeaturedBrandsSubView({super.key});

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5
      ),
      itemCount: 4,
      itemBuilder: (_, gridIndex) {
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: inDarkMode ? whiteColor.withOpacity(0.5) : blackColor.withOpacity(0.5),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomProductImageView(
                imageString: adidasLogoString,
                height: 40,
                width: 40,
                color: inDarkMode ? whiteColor : blackColor,
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
    );
  }
}