import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomProfileMenuRow extends StatelessWidget {
  final String field, fieldValue;
  final void Function() onTap;
  final IconData? icon;
  
  const CustomProfileMenuRow({
    super.key,
    required this.field,
    required this.fieldValue,
    required this.onTap,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children:[
            Expanded(
              flex: 3,
              child: Text(
                field,
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                fieldValue,
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Icon(icon ?? Iconsax.arrow_right))
          ]
        ),
      ),
    );
  }
}