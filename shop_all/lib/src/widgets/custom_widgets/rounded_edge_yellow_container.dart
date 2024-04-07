import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

class RoundEdgeYellowContainer extends StatelessWidget {
  final String text;

  const RoundEdgeYellowContainer({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: yellowColor.withOpacity(0.7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      )
    );
  }
}