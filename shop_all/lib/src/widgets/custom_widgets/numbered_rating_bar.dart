import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

class CustomNumberedRatingBar extends StatelessWidget {
  final String ratingNumber;
  final double value;

  const CustomNumberedRatingBar({
    super.key,
    required this.ratingNumber,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          ratingNumber,
          style: Theme.of(context).textTheme.labelLarge
        ),
        const Gap(10),
        Expanded(
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(5),
            value: value,
            valueColor: const AlwaysStoppedAnimation<Color>(blueColor),
            backgroundColor: whiteColor.withOpacity(0.4),
            minHeight: 12,
          ),
        )
      ],
    );
  }
}