import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_with_description_and_verification.dart';

class CustomCartItemWithAddAndRemove extends StatelessWidget {
  const CustomCartItemWithAddAndRemove({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomProductWithVerificationAndDescription(),
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