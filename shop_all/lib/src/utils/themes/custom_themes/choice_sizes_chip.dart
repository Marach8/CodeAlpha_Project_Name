import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/widgets/custom_widgets/container_with_border.dart';

class CustomChoiceSizesChipWidget extends StatelessWidget {
  final String sizeText;

  const CustomChoiceSizesChipWidget({
    super.key,
    required this.sizeText
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainerWithBorder(
      borderWidth: 1,
      showBackgroundColor: true,
      color: blueColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check),
          Text(
            sizeText,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}