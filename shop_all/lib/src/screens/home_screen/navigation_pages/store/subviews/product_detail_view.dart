import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/utils/themes/custom_themes/choice_chip.dart';
import 'package:shop_all/src/utils/themes/custom_themes/choice_sizes_chip.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/brand_name_with_verification.dart';
import 'package:shop_all/src/widgets/custom_widgets/container_with_border.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';
import 'package:shop_all/src/widgets/custom_widgets/rounded_edge_yellow_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';
import 'package:shop_all/src/widgets/other_widgets/clipper_class.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_all/src/widgets/other_widgets/product_details_bottom_navbar.dart';
import '../../../../../utils/constants/strings/text_strings.dart';

class CustomProductDetailView extends StatelessWidget {
  const CustomProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: ClipperWidget(),
              child: Container(
                color: greyColor,
                child: Stack(
                  children: [
                    const CustomProductImageView(imageString: luggageString),
                    Positioned(
                      bottom: 30,
                      left: 10,
                      right: 10,
                      child: SizedBox(
                        height: 60,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 10,
                          separatorBuilder: (_, __) => const Gap(10),
                          itemBuilder: (_, listIndex){
                            return CustomProductImageView(
                              borderRadius: 10,
                              imageString: luggageString,
                              backgroundColor: whiteColor.withOpacity(0.6),
                              showBorder: true,
                              height: 50,
                              width: 60,
                            );
                          },
                        ),
                      ),
                    ),

                    CustomAppBar(
                      leadingWidget: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.keyboard_backspace),
                      ),
                      actions: [
                        IconButton(
                          onPressed: (){},
                          icon: const Icon(Iconsax.heart5, color: redColor),
                        ),
                      ],
                    )
                  ],
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.star5, color: yellowColor),
                      const Gap(10),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '5.0 ',
                              style: Theme.of(context).textTheme.bodyMedium
                            ),
                            TextSpan(
                              text: '(200)',
                              style: Theme.of(context).textTheme.headlineSmall
                            )
                          ]
                        )
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.share),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const RoundEdgeYellowContainer(text: '67%'),
                      const Gap(10),
                      Text(
                        '\$500',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 3,
                          decorationColor: isInDarkMode(context) ? whiteColor : blackColor
                        ),
                      ),
                      const Gap(10),
                      Text(
                        '\$250',
                        style: Theme.of(context).textTheme.headlineMedium
                      ),
                      const Spacer()
                    ],
                  ),
                  const Gap(10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'White Ecolag Bag',
                      style: Theme.of(context).textTheme.bodyMedium
                    ),
                  ),
                  const Gap(15),
                  Row(
                    children: [
                      Text(
                        'Status',
                        style: Theme.of(context).textTheme.bodyMedium
                      ),
                      const Gap(20),
                      Text(
                        'In Stock',
                        style: Theme.of(context).textTheme.headlineSmall
                      ),
                    ],
                  ),
                  const Gap(20),
                  const Row(
                    children: [
                      CustomProductImageView(
                        imageString: luggageString,
                        height: 30,
                        width: 30,
                      ),
                      BrandNameWithVerificationWidget(brandName: 'Nike'),
                    ],
                  ),
                  
                  const Gap(20),
                  CustomContainerWithBorder(
                    showBackgroundColor: true,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              variationString,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),

                            const Gap(20),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Price',
                                      style: Theme.of(context).textTheme.bodyMedium
                                    ),
                                    const Gap(20),
                                    Text(
                                      '\$25 - \$67',
                                      style: Theme.of(context).textTheme.headlineSmall
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Status',
                                      style: Theme.of(context).textTheme.bodyMedium
                                    ),
                                    const Gap(20),
                                    Text(
                                      'In Stock',
                                      style: Theme.of(context).textTheme.headlineSmall
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          'Today is a very good day to talk with my baby and tell her how much I love her.',
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  const Gap(20),
                  const CustomSectionHeading(headingText: colorString),
                  const Gap(10),
                  const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      CustomChoiceChipWidget(color: yellowColor,),
                      CustomChoiceChipWidget(color: greenColor,),
                      CustomChoiceChipWidget(color: blueColor),
                    ],
                  ),
                  const CustomSectionHeading(headingText: sizeString),
                  const Gap(10),
                  const Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      CustomChoiceSizesChipWidget(sizeText: 'SZ 32'),
                      CustomChoiceSizesChipWidget(sizeText: 'SZ 54'),
                      CustomChoiceSizesChipWidget(sizeText: 'SZ 76')
                    ],
                  ),
                  const Gap(20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text(checkoutString),
                    ),
                  ),
                  const Gap(20),
                  const CustomSectionHeading(headingText: descriptionString),
                  const Gap(10),
                  const ReadMoreText(
                    fullDescriptionString,
                    trimCollapsedText: 'show more',
                    trimExpandedText: 'show less',
                    trimLines: 1,
                    trimMode: TrimMode.Line,
                  ),
                  const Gap(5),
                  const Divider(),
                  CustomSectionHeading(
                    headingText: 'Review(200)',
                    trailingButton: IconButton(
                      onPressed: (){},
                      icon: const Icon(Iconsax.activity),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
      bottomNavigationBar: const ProductDetailsBottomNavBarWidget(),
    );
  }
}