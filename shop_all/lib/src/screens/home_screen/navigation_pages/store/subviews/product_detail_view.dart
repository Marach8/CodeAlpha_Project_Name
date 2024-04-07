import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';
import 'package:shop_all/src/widgets/other_widgets/clipper_class.dart';

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
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}