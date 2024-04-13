import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/app_bar_title_text.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/brand_name_with_verification.dart';
import 'package:shop_all/src/widgets/custom_widgets/cart_item.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_title_text.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title:CustomAppbarTitleText(title: cartString,)
      ),

      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        separatorBuilder: (_, __) => const Gap(20),
        itemCount: 6,
         itemBuilder: (_, listIndex){
          return const CustomCartItemWithAddAndRemove();
         }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: ElevatedButton(
          onPressed: (){},
          child: const Text('Checkout \$156',),
        ),
      ),
    );
  }
}