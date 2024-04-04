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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomClipPath(child: UpperPartOfHomeView()),
            const CarouselSliderView(),
            SizedBox(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 1,
                  mainAxisExtent: 310,
                ),
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, gridIndex){
                  return const CustomProductCard1();
                }
              ),
            )
          ],
        ),
      )
    );
  }
}