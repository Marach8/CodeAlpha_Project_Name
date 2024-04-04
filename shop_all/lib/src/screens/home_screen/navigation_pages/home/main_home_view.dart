import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/home/home_subviews/carousel_slider.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/home/home_subviews/upper_division.dart';
import 'package:shop_all/src/widgets/custom_widgets/custom_clip_path.dart';
import 'package:shop_all/src/widgets/custom_widgets/product_card.dart';


class HomeDestinationView extends StatelessWidget {
  const HomeDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomClipPath(child: UpperPartOfHomeView()),
            CarouselSliderView(),
            const Gap(20),
            CustomProductCard1()
          ],
        ),
      )
    );
  }
}