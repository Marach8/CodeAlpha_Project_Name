import 'package:flutter/material.dart';

class CustomAppBarLeadingWidget extends StatelessWidget {
  final void Function() onPressed;

  const CustomAppBarLeadingWidget({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.keyboard_backspace),
    );
  }
}