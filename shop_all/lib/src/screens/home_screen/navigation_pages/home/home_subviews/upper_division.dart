import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/search_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';
import 'package:shop_all/src/widgets/other_widgets/appbar_actions/items_notifications.dart';

class UpperPartOfHomeView extends StatelessWidget {
  const UpperPartOfHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context),
      height: 350,
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
    
          Column(
            children: [
              CustomAppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shopHavenWelcomeString,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      shopHavenIntroString,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                actions: const [ShopItemsNotification()],
              ),
              const CustomSearchContainer(text: searchString),
    
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    const CustomdSectionHeading(headingText: popularCategoriesString),
                    const Gap(20),
                    
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, listIndex){
                          return Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 40,
                            width: 60,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const CustomCircularContainer(
                                  radius: 60,
                                  color: whiteColor,
                                ),
                                const Gap(5),
                                Text(
                                  'friend',
                                  style: Theme.of(context).textTheme.labelMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )
                              ]
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ]
      ),
    );
  }
}