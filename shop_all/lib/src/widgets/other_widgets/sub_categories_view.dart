import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/app_bar_title_text.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/brand_name_with_verification.dart';
import 'package:shop_all/src/widgets/custom_widgets/container_with_border.dart';
import 'package:shop_all/src/widgets/custom_widgets/kite_shaped_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';
import 'package:shop_all/src/widgets/custom_widgets/rounded_edge_yellow_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomAppbarTitleText(title: 'Sports Category')
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        children: [
          CustomProductImageView(
            imageString: luggageString,
            width: getScreenWidth(context),
            height: 200,
            backgroundColor: whiteColor.withOpacity(0.3),
          ),

          const Gap(20),
          
          const CustomSectionHeading(
            headingText: 'Sports Wears',
            showTrailingButton: true,
          ),

          const Gap(20),

          SizedBox(
            height: 150,
            child: ListView.separated(
              separatorBuilder: (context, index) => const Gap(20),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 100,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  child: CustomRoundedContainerWithBorder(
                    showBackgroundColor: true,
                    color: inDarkMode ? whiteColor.withOpacity(0.08) : blackColor.withOpacity(0.03),
                    hideBorder: true,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Stack(
                          children: [
                            Center(
                              child: CustomProductImageView(
                                imageString: luggageString,
                                height: 100,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: RoundEdgeYellowContainer(text: '74%',)
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Icon(Iconsax.heart5, color: redColor,)
                            )
                          ],
                        ),
                        
                        const Gap(10),

                        SizedBox(
                          width: getScreenWidth(context)/2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ash colored travel bag for travellers',
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Gap(5),
                              const CustomBrandNameWithVerificationWidget(brandName: 'Nike'),
                              const Gap(5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$760',
                                    style: Theme.of(context).textTheme.headlineMedium
                                  ),
                                  CustomKiteShapedContainerWithAddIcon(
                                    color: inDarkMode ? blueColor : blackColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          )
        ]
      )
    );
  }
}