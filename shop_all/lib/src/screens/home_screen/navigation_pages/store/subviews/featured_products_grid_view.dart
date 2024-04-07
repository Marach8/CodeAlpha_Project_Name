import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/store/subviews/product_detail_view.dart';
import 'package:shop_all/src/widgets/custom_widgets/featured_brand_widget.dart';

class FeaturedBrandsSubView extends StatelessWidget {
  const FeaturedBrandsSubView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5
      ),
      itemCount: 4,
      itemBuilder: (_, gridIndex) {
        return GestureDetector(
          onTap: () => Get.to(() => const CustomProductDetailView()),
          child: const FeaturedBrandWidget()
        );
      }
    );
  }
}