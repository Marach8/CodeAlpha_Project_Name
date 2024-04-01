import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/custom_clip_path.dart';
import 'package:shop_all/src/widgets/other_widgets/appbar_actions/items_notifications.dart';

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
                child: Stack(
                  children: [
                    const Positioned(
                      top: -150,
                      right: -250,
                      child: CustomCircularContainer(radius: 400)
                    ),
                    const Positioned(
                      bottom: -150,
                      right: -250,
                      child: CustomCircularContainer(radius: 400)
                    ),
                    
                    CustomAppBar(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Marach',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'Marach',
                            style: Theme.of(context).textTheme.headlineMedium,
                          )
                        ],
                      ),
                      actions: const [ShopItemsNotification()],
                    )
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