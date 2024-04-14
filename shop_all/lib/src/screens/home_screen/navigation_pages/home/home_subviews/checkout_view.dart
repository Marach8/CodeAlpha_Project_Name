import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/screens/home_screen/main_home_screen.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/app_bar_title_text.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/container_with_border.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_with_description_and_verification.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';
import 'package:shop_all/src/widgets/custom_widgets/success_screen.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomAppbarTitleText(title: 'Order Review',)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: const [
                  CustomProductWithVerificationAndDescription(),
                  Gap(20),
                  CustomProductWithVerificationAndDescription()
                ],
              ),

              const Gap(20),
              CustomRoundedContainerWithBorder(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Have a promo code? Enter here',
                          hintMaxLines: 2,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('Apply'),
                      ),
                    )
                  ],
                ),
              ),

              const Gap(20),
              CustomRoundedContainerWithBorder(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$506',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tax Fee',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$100',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Fee',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$57',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order Total',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$5109',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const Divider(),

                    const Gap(20),

                    CustomSectionHeading(
                      headingText: paymentMethodString,
                      trailingButton: TextButton(
                        onPressed: (){},
                        child: const Text('Change'),
                      )
                    ),
                    Row(
                      children: [
                        const CustomProductImageView(
                          imageString: luggageString,
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          'PayPal',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSectionHeading(
                          headingText: 'Shipping Address',
                          trailingButton: TextButton(
                            onPressed: (){},
                            child: const Text('Change'),
                          )
                        ),
                        Text(
                          '2C Onuiyi Road, Nsukka',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const Gap(5),
                        Row(
                          children: [
                            const Icon(Icons.phone, size: 15,),
                            const Gap(5),
                            Text(
                              '08022935013',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.person, size: 15,),
                            const Gap(5),
                            Text(
                              'University of Nigeria Nsukka',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CustomSuccessScreen(
            title: 'Order Successfully Placed',
            subtitle: 'Your item will be shipped soon!',
            buttonText: 'Continue',
            onPressed: () => Get.offAll(() => const MainHomeView())
          )
          ),
          child: const Text('Finish Off'),
        ),
      ),
    );
  }
}