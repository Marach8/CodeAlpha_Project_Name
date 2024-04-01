import 'package:flutter/material.dart';

class CustomdSectionHeading extends StatelessWidget {
  final String headingText;
  final Widget? trailingButton;

  const CustomdSectionHeading({
    super.key,
    required this.headingText,
    this.trailingButton
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingText,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailingButton ?? const SizedBox.shrink()
      ],
    );
  }
}