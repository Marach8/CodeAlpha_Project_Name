import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/home/home_subviews/products_grid_view.dart';
import 'package:shop_all/src/widgets/custom_widgets/app_bar_title_text.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_card.dart';

class GeneralProductsView extends StatelessWidget {
  const GeneralProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomAppbarTitleText(title: 'Popular Products')
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          DropdownButtonFormField(
            onChanged: (value){},
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort)
            ),
            items: ['Emmanuel', 'Chinasa', 'David', 'Ekene', 'Festus', 'Daniel']
              .map(
                (listElement) => DropdownMenuItem(
                  value: listElement,
                  child: Text(
                    listElement,
                    style: Theme.of(context).textTheme.titleMedium
                  ),
                )
              ).toList()
          ),
          const Gap(20),

          ProductsGridView(
            crossAxisCount: 2,
            itemCount: 10,
            itemBuilder: (_, gridIndex){
              return const CustomProductCard1();
            },
          )
        ],
      )
    );
  }
}