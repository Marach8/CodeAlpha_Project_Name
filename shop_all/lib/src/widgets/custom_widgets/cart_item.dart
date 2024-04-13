import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/brand_name_with_verification.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_title_text.dart';

class CustomCartItemWithAddAndRemove extends StatelessWidget {
  const CustomCartItemWithAddAndRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomProductImageView(
              imageString: sneakersString,
              backgroundColor: whiteColor.withOpacity(0.4),
              borderRadius: 5,
              height: 50,
              width: 50,
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BrandNameWithVerificationWidget(brandName: 'Nike'),
                const CustomProductTitleText(title: 'Nike Wedding shoes'),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Color ', style: Theme.of(context).textTheme.labelSmall,
                      ),
                      TextSpan(
                        text: 'Red ', style: Theme.of(context).textTheme.titleLarge
                      ),
                      TextSpan(
                        text: 'Size ', style: Theme.of(context).textTheme.labelSmall
                      ),
                      TextSpan(
                        text: '45 ', style: Theme.of(context).textTheme.titleLarge
                      )
                    ]
                  )
                )
              ],
            )
          ],
        ),
    
        const Gap(10),
    
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(60),
            const CustomCircularContainer(
              radius: 30,
              child: Icon(Icons.remove),
            ),
            const Gap(10),
            Text(
              '2',
              style: Theme.of(context).textTheme.titleLarge
            ),
            const Gap(10),
            const CustomCircularContainer(
              radius: 30,
              color: blueColor,
              child: Icon(Icons.add),
            ),
            const Spacer(),
            Text(
              '\$129',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        )
      ],
    );
  }
}