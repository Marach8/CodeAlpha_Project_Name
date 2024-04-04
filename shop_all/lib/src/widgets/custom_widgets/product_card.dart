import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';

class CustomProductCard1 extends StatelessWidget {
  const CustomProductCard1({super.key});

  @override
  Widget build(BuildContext context) {
    //final inDarkMode = isInDarkMode(context);

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: greyColor,
        boxShadow: [
          BoxShadow(
            color: redColor.withOpacity(0.1),
            blurRadius: 50,
            spreadRadius: 10,
            offset: const Offset(0, 2)
          )
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Stack(
              children: [
                const CustomProductImageView(imageString: sneakersString),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: yellowColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '60%',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Iconsax.heart5, color: redColor)
                    )
                  ],
                )
              ],
            ),
          ),
          const Gap(20),
          Text(
            'Nike Track suit Block',
            style: Theme.of(context).textTheme.bodyMedium
          ),
          const Gap(15),
          Text(
            'Nike',
            style: Theme.of(context).textTheme.labelMedium
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$0.0 - \$122.5',
                style: Theme.of(context).textTheme.headlineMedium
              ),
              Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.zero,
                    topStart: Radius.circular(10),
                    bottomEnd: Radius.circular(10),
                    bottomStart: Radius.zero
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}