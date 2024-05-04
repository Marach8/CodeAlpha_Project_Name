import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/products/banner/banner_controller.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/product_image_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_image_renderer.dart';


class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    //final inDarkMode = isInDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: const [
              CustomProductImageView(imageString: airJordanShoeString),
              CustomProductImageView(imageString: bionuclarString),
              CustomProductImageView(imageString: hoodieString),
              CustomProductImageView(imageString: sneakersString),
              CustomProductImageView(imageString: luggageString)
            ],
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) => controller.updateIndicator(index)
            ),
          ),
          const Gap(10),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int x = 0; x < 5; x++) 
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 5,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: controller.carouselIndex.value == x ? blueColor : greyColor
                  ),
                  
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}