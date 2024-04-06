import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';
import 'package:shop_all/src/widgets/other_widgets/clipper_class.dart';

class CustomClipPath extends StatelessWidget {
  final Widget child;

  const CustomClipPath({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperWidget(),
      child: Container(
        width: getScreenWidth(context),
        color: blueColor,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            const Positioned(
              top: -150,
              right: -250,
              child: CustomCircularContainer(radius: 400)
            ),
            const Positioned(
              bottom: -150,
              right: -250,
              child: CustomCircularContainer(radius: 400)
            ),
            child
          ],
        ),
      ),
    );
  }
}