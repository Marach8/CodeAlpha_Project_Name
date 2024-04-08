import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final dynamic theme;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.theme
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge
    );
  }
}