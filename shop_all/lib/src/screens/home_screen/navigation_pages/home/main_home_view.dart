import 'package:flutter/material.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/home/home_subviews/carousel_slider.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/home/home_subviews/header_division.dart';
import 'package:shop_all/src/screens/home_screen/navigation_pages/home/home_subviews/products_grid_view.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/custom_clip_path.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';


class HomeDestinationView extends StatelessWidget {
  const HomeDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
          children: [
            CustomClipPath(child: UpperPartOfHomeView()),
            CarouselSliderView(),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
              child: CustomSectionHeading(headingText: popularProductString),
            ),
            ProductsGridView()
          ],
        ),
    );
  }
}