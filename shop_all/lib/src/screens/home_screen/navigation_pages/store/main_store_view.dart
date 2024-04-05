import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/store/subviews/featured_products_view.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/logo_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';
import 'package:shop_all/src/widgets/custom_widgets/search_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';
import 'package:shop_all/src/widgets/other_widgets/appbar_actions/items_notifications.dart';

class StoreDestinationView extends StatelessWidget {
  const StoreDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    final inDarkMode = isInDarkMode(context);

    return Scaffold(
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
              pinned: true,
              floating: true,
              backgroundColor: inDarkMode ? blackColor : whiteColor,
              expandedHeight: 500,
              
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
                      trailingButton: TextButton(
                        onPressed: (){},
                        child: Text(
                          viewAllString,
                          style: Theme.of(context).textTheme.bodyLarge
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: FeaturedBrandsSubView(),
                  )
                ],
              ),
            )
          ];
        },
        body: Container()
      ),
    );
  }
}