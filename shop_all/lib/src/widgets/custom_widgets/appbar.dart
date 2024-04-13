import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final List<Widget>? actions;
  final Widget? title;
  final bool? hideLeadingBackArrow;  

  const CustomAppBar({
    super.key,
    this.actions,
    this.title,
    this.hideLeadingBackArrow
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: hideLeadingBackArrow ?? false ? null : IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.keyboard_backspace),
        ),
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
}