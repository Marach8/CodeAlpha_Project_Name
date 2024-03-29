import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

class FooterContainer extends StatelessWidget {
  final String logoString;
  final void Function() onPressed;

  const FooterContainer({
    super.key,
    required this.logoString,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: greyColor),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Image.asset(
          logoString,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}