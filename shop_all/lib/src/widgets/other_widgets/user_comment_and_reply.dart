import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/container_with_border.dart';
import 'package:shop_all/src/widgets/custom_widgets/read_more_text.dart';
import 'package:shop_all/src/widgets/custom_widgets/star_rating_indicator.dart';
import 'package:shop_all/src/widgets/custom_widgets/user_display_picture.dart';

class CustomUserCommentAndReply extends StatelessWidget {
  const CustomUserCommentAndReply({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CustomUserDisplayPicture(radius: 40,),
            const Gap(10),
            Text(
              'Marachuckwu',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
        const Gap(10),
        
        Row(
          children: [
            const CustomStarRatingIndicator(rating: 4),
            const Gap(10),
            Text(
              '01-02-2022',
              style: Theme.of(context).textTheme.titleLarge
            )
          ]
        ),
        const Gap(10),
        const CustomReadMoreWidget(text: review1String),
        const Gap(20),
        CustomRoundedContainerWithBorder(
          hideBorder: true,
          showBackgroundColor: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ShopHaven',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    '01-02-2022',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ]
              ),
              const Gap(20),
              const CustomReadMoreWidget(text: review1ResponseSTring)
            ]
          ),
        )
      ],
    );
  }
}