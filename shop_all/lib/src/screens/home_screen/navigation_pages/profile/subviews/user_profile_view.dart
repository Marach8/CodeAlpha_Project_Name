import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/circular_container.dart';
import 'package:shop_all/src/widgets/custom_widgets/lottie_view.dart';
import 'package:shop_all/src/widgets/custom_widgets/profile_menu_row.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(profileString),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const CustomCircularContainer(
                      radius: 200,
                      child: CustomLottieAnimationView(lottieString: lottie7,)
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text(
                        changePhotoString,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              const Divider(),
              const Gap(10),
              const CustomSectionHeading(headingText: profileInformationString),
              const Gap(20),
              CustomProfileMenuRow(
                field: nameString,
                fieldValue: 'MarachNnanna',
                onTap: (){},
              ),
              CustomProfileMenuRow(
                field: nameString,
                fieldValue: 'MarachNnanna',
                onTap: (){},
              ),
              CustomProfileMenuRow(
                field: nameString,
                fieldValue: 'MarachNnanna',
                onTap: (){},
              ),
              const Gap(10),
              const Divider(),
              const Gap(10),
              const CustomSectionHeading(headingText: profileInformationString),
              const Gap(10),
              CustomProfileMenuRow(
                field: nameString,
                fieldValue: 'MarachNnanna',
                icon: Iconsax.copy,
                onTap: (){},
              ),
              CustomProfileMenuRow(
                field: nameString,
                fieldValue: 'MarachNnanna',
                onTap: (){},
              ),
              CustomProfileMenuRow(
                field: nameString,
                fieldValue: 'MarachNnanna',
                onTap: (){},
              ),
              CustomProfileMenuRow(
                field: nameString,
                fieldValue: 'MarachNnanna',
                onTap: (){},
              ),
              const Gap(10),
              const Divider(),
              const Gap(10),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (){},
                  child: const Text(
                    deleteAccountString,
                    style: TextStyle(color: redColor),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}