import 'package:flutter/material.dart';

class CustomProductTitleText extends StatelessWidget {
  final String title;
  const CustomProductTitleText ({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}