import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: whiteColor,
      highlightColor: blackColor,
      child: Text(
        loadingString,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}