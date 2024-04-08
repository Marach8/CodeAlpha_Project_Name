import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar_leading.dart';
import 'package:shop_all/src/widgets/custom_widgets/numbered_rating_bar.dart';
import 'package:shop_all/src/widgets/custom_widgets/star_rating_indicator.dart';
import 'package:shop_all/src/widgets/other_widgets/user_comment_and_reply.dart';


class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          reviewsRatingString,
          style: Theme.of(context).textTheme.headlineMedium
        ),
        leadingWidget: CustomAppBarLeadingWidget(onPressed: (){}),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                fullRatingString,
                style: Theme.of(context).textTheme.titleMedium
              ),
              const Gap(10),

              SizedBox(
                width: getScreenWidth(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '4.9',
                      style: Theme.of(context).textTheme.displayLarge
                    ),

                    const Gap(20),
                    const Expanded(
                      child: Column(
                        children: [
                          CustomNumberedRatingBar(
                            ratingNumber: '5',
                            value: 1,
                          ),
                          CustomNumberedRatingBar(
                            ratingNumber: '4',
                            value: 0.8,
                          ),
                          CustomNumberedRatingBar(
                            ratingNumber: '3',
                            value: 0.6,
                          ),
                          CustomNumberedRatingBar(
                            ratingNumber: '2',
                            value: 0.4,
                          ),
                          CustomNumberedRatingBar(
                            ratingNumber: '1',
                            value: 0.2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Gap(10),
              const CustomStarRatingIndicator(rating: 5),
              Text(
                '150.54',
                style: Theme.of(context).textTheme.headlineSmall
              ),
              const Gap(20),
              const CustomUserCommentAndReply(),
              const Gap(40),
              const CustomUserCommentAndReply(),
              const Gap(40),
              const CustomUserCommentAndReply(),
              const Gap(40),
            ]
          ),
        ),
      )
    );
  }
}