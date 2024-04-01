import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';

class CustomSearchContainer extends StatelessWidget {
  final String text;

  const CustomSearchContainer({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
      final inDarkMode = isInDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      width: getScreenWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: inDarkMode ? blackColor : whiteColor,
        border: Border.all(
          color: inDarkMode ? whiteColor : blackColor,
          width: 1
        )
      ),
      child: Row(
        children: [
          const Icon(Iconsax.search_normal_1),
          const Gap(20),
          Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall
          )
        ],
      ),
    );
  }
}