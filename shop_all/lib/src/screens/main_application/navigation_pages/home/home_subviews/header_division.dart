import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/backend/user/user_controller.dart';
import 'package:shop_all/src/models/user_model.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/search_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';
import 'package:shop_all/src/widgets/custom_widgets/shimmer.dart';
import 'package:shop_all/src/widgets/other_widgets/appbar_actions/items_notifications.dart';
import 'package:shop_all/src/widgets/other_widgets/sub_categories_view.dart';

class UpperPartOfHomeView extends StatelessWidget {
  const UpperPartOfHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return Column(
      children: [
        CustomAppBar(
          hideLeadingBackArrow: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Visibility(
                  visible: userController.userModel.value != UserModel.empty(),
                  replacement: const CustomShimmerWidget(),
                  child: Text(
                    userController.userModel.value.userName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
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
              const CustomSectionHeading(headingText: popularCategoriesString),
              const Gap(20),
              
              SizedBox(
                height: 110,
                child: ListView.separated(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const Gap(10),
                  itemBuilder: (_, listIndex){
                    return GestureDetector(
                      onTap: () => Get.to(() => const SubCategoriesView()),
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
    );
  }
}