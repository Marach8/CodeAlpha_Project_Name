import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/backend/user/user_controller.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/profile/subviews/change_name_view.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/lottie_animation_strings.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/app_bar_title_text.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/cached_network_image.dart';
import 'package:shop_all/src/widgets/custom_widgets/dynamic_profile_menu_row.dart';
import 'package:shop_all/src/widgets/custom_widgets/lottie_animation_view.dart';
import 'package:shop_all/src/widgets/custom_widgets/profile_menu_row.dart';
import 'package:shop_all/src/widgets/custom_widgets/section_heading.dart';


class UserProfileView extends StatelessWidget {
  const UserProfileView ({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final userModel = userController.userModel.value;
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomAppbarTitleText(title: profileString)
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
                    Obx(
                      () => ClipRRect(
                        borderRadius: BorderRadius.circular(getScreenWidth(context)),
                        child: Visibility(
                          visible: userController.userModel.value.displayPicture.isNotEmpty,
                          replacement: const CustomLottieAnimationView(lottieString: lottie7),
                          child: CustomCachedNetworkImage(
                            imageUrl: userController.userModel.value.displayPicture,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async => await userController.updateProfilePicture(),
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
              
              CustomDynamicProfileMenuRow(
                child: CustomProfileMenuRow(
                  field: nameString,
                  fieldValue: userModel.firstName + spaceString + userModel.lastName,
                  onTap: () => Get.to(() => const ChangeNameOfUserView()),
                ),
              ),

              CustomDynamicProfileMenuRow(
                child: CustomProfileMenuRow(
                  field: userNameString,
                  fieldValue: userModel.userName,
                  onTap: (){},
                ),
              ),
              
              const Gap(10),
              const Divider(),

              const Gap(10),

              const CustomSectionHeading(headingText: personalInformationString),

              const Gap(10),

              CustomDynamicProfileMenuRow(
                child: CustomProfileMenuRow(
                  icon: Iconsax.copy,
                  field: userIdString,
                  fieldValue: userModel.userId,
                  onTap: (){},
                ),
              ),
              CustomDynamicProfileMenuRow(
                child: CustomProfileMenuRow(
                  field: emailString,
                  fieldValue: userModel.email,
                  onTap: (){},
                ),
              ),
              CustomDynamicProfileMenuRow(
                child: CustomProfileMenuRow(
                  field: phoneString,
                  fieldValue: userModel.phoneNumber,
                  onTap: (){},
                ),
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
                  onPressed: () => userController.showDeleteAccountWarning(),
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