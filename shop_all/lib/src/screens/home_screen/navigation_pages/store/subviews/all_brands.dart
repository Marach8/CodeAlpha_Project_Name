import 'package:flutter/material.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/home/home_subviews/products_grid_view.dart';
import 'package:shop_all/src/widgets/custom_widgets/app_bar_title_text.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/featured_brand_widget.dart';

class AllBrandsView extends StatelessWidget {
  const AllBrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomAppbarTitleText(title: 'All Brands')
      ),
      body: ProductsGridView(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        itemCount: 10,
        mainAxisExtent: 70,
        itemBuilder: (_, gridIndex){
          return const FeaturedBrandWidget();
        },
      )
    );
  }
}