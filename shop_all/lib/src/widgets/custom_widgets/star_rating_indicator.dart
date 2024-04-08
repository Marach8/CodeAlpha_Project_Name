import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

class CustomStarRatingIndicator extends StatelessWidget {
  final double rating;

  const CustomStarRatingIndicator({
    super.key,
    required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      unratedColor: greyColor,
      rating: rating,
      itemPadding: const EdgeInsets.only(right: 5),
      itemSize: 20,
      itemBuilder: (_, __){
        return const Icon(Iconsax.star);
      },
    );
  }
}