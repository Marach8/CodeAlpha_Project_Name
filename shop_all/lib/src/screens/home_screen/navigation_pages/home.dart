import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/custom_clip_path.dart';
import 'package:shop_all/src/widgets/other_widgets/clipper_class.dart';

class HomeDestinationView extends StatelessWidget {
  const HomeDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomClipPath(
              child: Container(
                width: 400,
                height: 400,
                color: blueColor,
                padding: EdgeInsets.zero,
                child: const Stack(
                  children: [
                    Positioned(
                      top: -150,
                      right: -250,
                      child: CustomCircularContainer(radius: 400)
                    ),
                    Positioned(
                      bottom: -150,
                      right: -250,
                      child: CustomCircularContainer(radius: 400)
                    ),
                  ]
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}