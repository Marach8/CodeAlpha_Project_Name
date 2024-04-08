import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreWidget extends StatelessWidget {
  final String text;
  const CustomReadMoreWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      trimLines: 1,
      trimMode: TrimMode.Line,
    );
  }
}