import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';

class CustomProductImageView extends StatelessWidget {
  final String imageString;

  const CustomProductImageView({
    super.key,
    required this.imageString
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: transparentColor
      ),
      child: Image.asset(
        imageString,
        fit: BoxFit.contain
      ),
    );
  }
}