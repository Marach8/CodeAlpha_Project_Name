import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';

class CustomRoundedContainerWithBorder extends StatelessWidget {
  final Widget child;
  final double? borderWidth;
  final bool? hideBorder, showBackgroundColor;
  final Color? color;

  const CustomRoundedContainerWithBorder({
    super.key,
    required this.child,
    this.borderWidth,
    this.hideBorder,
    this.color,
    this.showBackgroundColor
  });

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: showBackgroundColor ?? false ? (color ?? whiteColor.withOpacity(0.2)) : null,
        border: hideBorder ?? false ? null : Border.all(
          width: borderWidth ?? 1,
          color: inDarkMode ? whiteColor.withOpacity(0.5) : blackColor.withOpacity(0.5),
        )
      ),
      child: child,
    );
  }
}