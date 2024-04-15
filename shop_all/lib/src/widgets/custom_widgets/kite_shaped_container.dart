import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';

class CustomKiteShapedContainerWithAddIcon extends StatelessWidget {
  final Color color;

  const CustomKiteShapedContainerWithAddIcon({
    super.key,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadiusDirectional.only(
          topEnd: Radius.zero,
          topStart: Radius.circular(10),
          bottomEnd: Radius.circular(10),
          bottomStart: Radius.zero
        )
      ),
      child: IconButton(
        onPressed: (){},
        icon: const Icon(Icons.add, color: whiteColor,),
      ),
    );
  }
}