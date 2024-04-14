import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/brand_name_with_verification.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_title_text.dart';

class CustomProductWithVerificationAndDescription extends StatelessWidget {
  const CustomProductWithVerificationAndDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            const CustomBrandNameWithVerificationWidget(brandName: 'Nike'),
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
    );
  }
}