import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/widgets/custom_widgets/app_bar_title_text.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/container_with_border.dart';
import 'package:shop_all/src/widgets/other_widgets/product_order_details.dart';

class ProductOrderView extends StatelessWidget {
  const ProductOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomAppbarTitleText(title: 'My Orders')
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        itemCount: 20,
        separatorBuilder: (_, __) => const Gap(10),
        itemBuilder: (_, listIndex){
          return const ProductOrderDetails();
        },
      )
    );
  }
}

