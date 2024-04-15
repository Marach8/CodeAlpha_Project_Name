import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

class CustomSectionHeading extends StatelessWidget {
  final String headingText;
  final bool showTrailingButton;
  final String? buttonTitle;
  final void Function()? onPressed;

  const CustomSectionHeading({
    super.key,
    required this.headingText,
    this.showTrailingButton = false,
    this.buttonTitle,
    this.onPressed
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
        showTrailingButton ? TextButton(
          onPressed: onPressed,
          child: Text(
            buttonTitle ?? viewAllString,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ): const SizedBox.shrink()
      ],
    );
  }
}