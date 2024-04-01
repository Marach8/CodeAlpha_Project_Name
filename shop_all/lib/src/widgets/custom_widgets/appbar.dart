import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final List<Widget>? actions;
  final Widget? title,
  leadingWidget;
  
  const CustomAppBar({
    super.key,
    this.actions,
    this.title,
    this.leadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: leadingWidget,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
}