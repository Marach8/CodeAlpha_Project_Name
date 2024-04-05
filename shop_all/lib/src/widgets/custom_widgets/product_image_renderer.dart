import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

class CustomProductImageView extends StatelessWidget {
  final String imageString;
  final double? height, width;
  final Color? color;

  const CustomProductImageView({
    super.key,
    required this.imageString,
    this.height,
    this.width,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: transparentColor
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