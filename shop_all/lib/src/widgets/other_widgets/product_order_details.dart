import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/widgets/custom_widgets/container_with_border.dart';

class ProductOrderDetails extends StatelessWidget {
  const ProductOrderDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainerWithBorder(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Iconsax.wallet),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Processing',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    '08 April 2024',
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: (){},
                icon: const Icon(Iconsax.arrow_right),
              )
            ],
          ),
    
          const Gap(20),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Iconsax.location),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '[#123456]',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    )
                  ],
                ),
              ),
    
              Expanded(
                child: Row(
                  children: [
                    const Icon(Iconsax.calendar),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Date',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '25 March 2018',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}