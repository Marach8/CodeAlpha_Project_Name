import 'package:flutter/material.dart';

class CustomAppbarTitleText extends StatelessWidget {
  final String title;
  
  const CustomAppbarTitleText({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium
    );
  }
}