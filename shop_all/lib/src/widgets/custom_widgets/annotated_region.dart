import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';

class GenericAnnotatedRegion extends StatelessWidget {
  final Widget child;

  const GenericAnnotatedRegion({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: inDarkMode ? blackColor: whiteColor,
        systemNavigationBarIconBrightness: inDarkMode ? Brightness.light : Brightness.dark,
        statusBarColor: transparentColor,
        statusBarIconBrightness: inDarkMode ? Brightness.light : Brightness.dark
      ),
      child: child
    );
  }
}