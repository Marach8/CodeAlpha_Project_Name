import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';

class CustomProductImageView extends StatelessWidget {
  final String imageString;
  final double? height, width,
  borderRadius;
  final Color? color, backgroundColor;
  final bool? showBorder;

  const CustomProductImageView({
    super.key,
    required this.imageString,
    this.height,
    this.width,
    this.showBorder,
    this.borderRadius,
    this.color,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
        color: backgroundColor ?? transparentColor,
        border: showBorder ?? false ? Border.all(
          width: 0.5,
          color: isInDarkMode(context) ? whiteColor : blackColor
        ): null
      ),
      child: Image.asset(
        imageString,
        fit: BoxFit.contain,
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}