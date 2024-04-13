import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

class CustomCircularContainer extends StatelessWidget {
  final Widget? child;
  final double radius;
  final Color? color;

  const CustomCircularContainer({
    super.key,
    required this.radius,
    this.child,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: radius,
      height: radius,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:color ?? whiteColor.withOpacity(0.2)
      ),
      child: child,
    );
  }
}