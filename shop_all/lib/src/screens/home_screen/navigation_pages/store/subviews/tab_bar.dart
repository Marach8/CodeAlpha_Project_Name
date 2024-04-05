import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';

class TabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final List<Tab> tabs;

  const TabBarWidget({
    super.key,
    required this.tabs
  });

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);

    return Material(
      color: inDarkMode ? blackColor : whiteColor,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        indicatorColor: blueColor,
        dividerHeight: 0,
        padding: EdgeInsets.zero,
        isScrollable: true,
        labelColor: inDarkMode ? whiteColor : blackColor,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}