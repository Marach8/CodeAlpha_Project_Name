import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/home/home_subviews/products_grid_view.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/logo_strings.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/container_with_border.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';

class CosmeticsTabView extends StatelessWidget {
  const CosmeticsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CustomContainerWithBorder(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomProductImageView(
                        imageString: adidasLogoString,
                        height: 40,
                        width: 40,
                        color: isInDarkMode(context) ? whiteColor : blackColor,
                      ),
                      const Gap(10),
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
                                const Gap(5),
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
                  
                  const Gap(20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: CustomContainerWithBorder(
                          hideBorder: true,
                          showBackgroundColor: true,
                          child: CustomProductImageView(imageString: airJordanShoeString,),
                        ),
                      ),
                      Gap(5),
                      Expanded(
                        child: CustomContainerWithBorder(
                          hideBorder: true,
                          showBackgroundColor: true,
                          child: CustomProductImageView(imageString: sneakersString,),
                        ),
                      ),
                      Gap(5),
                      Expanded(
                        child: CustomContainerWithBorder(
                          hideBorder: true,
                          showBackgroundColor: true,
                          child: CustomProductImageView(imageString: luggageString),
                        ),
                      )
                    ]
                  )
                ],
              ),
            ),
          ),

          const Gap(20),
          CustomSectionHeading(
            headingText: 'We Also Have',
            trailingButton: TextButton(
              onPressed: (){},
              child: Text(
                viewAllString,
                style: Theme.of(context).textTheme.bodyLarge
              ),
            ),
          ),
          const ProductsGridView()
        ],
      ),
    );
  }
}