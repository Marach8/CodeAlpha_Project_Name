import 'package:flutter/material.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';

class CustomChoiceChipWidget extends StatelessWidget {
  final Color color;
  const CustomChoiceChipWidget({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: CustomCircularContainer(
        color: color,
        radius: 35,
        child: const Icon(Icons.check),
      ),
    );
  }
}