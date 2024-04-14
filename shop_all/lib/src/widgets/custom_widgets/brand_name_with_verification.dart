import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

class CustomBrandNameWithVerificationWidget extends StatelessWidget {
  final String brandName;
  const CustomBrandNameWithVerificationWidget({
    super.key,
    required this.brandName
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          brandName,
          style: Theme.of(context).textTheme.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(5),
        const Icon(Iconsax.verify5, color: blueColor, size: 20,),
      ],
    );
  }
}