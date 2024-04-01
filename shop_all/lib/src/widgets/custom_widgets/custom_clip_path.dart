import 'package:flutter/material.dart';
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
      child: child,
    );
  }
}