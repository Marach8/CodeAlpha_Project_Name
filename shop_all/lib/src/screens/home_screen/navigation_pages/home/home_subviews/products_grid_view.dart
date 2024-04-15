import 'package:flutter/material.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_card.dart';

class ProductsGridView extends StatelessWidget {
  final int itemCount, 
  crossAxisCount;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final double mainAxisExtent;
  final EdgeInsetsGeometry padding;

  const ProductsGridView({
    super.key,
    required this.itemCount,
    required this.crossAxisCount,
    required this.itemBuilder,
    this.mainAxisExtent = 310,
    this.padding = EdgeInsets.zero
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        mainAxisExtent: mainAxisExtent
      ),
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: itemBuilder,
    );
  }
}