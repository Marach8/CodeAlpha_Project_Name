import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/products/category/category_controller.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/store/subviews/bottom_tab_views/custom_tab_bar_view.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/store/subviews/all_brands.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/store/subviews/featured_products_grid_view.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/store/subviews/tab_bar.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/search_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';
import 'package:shop_all/src/widgets/other_widgets/appbar_actions/items_notifications.dart';

class StoreDestinationView extends StatelessWidget {
  const StoreDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);
    final categoryController = CategoryControler.instance;

    return DefaultTabController(
      length: categoryController.featuredCategories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title:Text(
            storeString,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [ShopItemsNotification()],
        ),

        body: NestedScrollView(
          headerSliverBuilder: (_, scrollInnerBox){
            return [
              SliverAppBar(
                //pinned: true,
                floating: true,
                backgroundColor: inDarkMode ? blackColor : whiteColor,
                expandedHeight: 350,
                
                flexibleSpace: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const CustomSearchContainer(text: searchString),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: CustomSectionHeading(
                        headingText: featuredProductsString,
                        showTrailingButton: true,
                        onPressed: () => Get.to(() => const AllBrandsView()),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: FeaturedBrandsSubView(),
                    )
                  ],
                ),
      
                bottom: TabBarWidget(
                  tabs: categoryController.featuredCategories.map(
                    (category) => Tab(child: Text(category.name))
                  ).toList()
                ),
              )
            ];
          },

          body: TabBarView(
            children: categoryController.featuredCategories.map(
              (categoryModel) => CustomTabBarView(categoryModel: categoryModel)
            ).toList()
          )
        ),
      ),
    );
  }
}