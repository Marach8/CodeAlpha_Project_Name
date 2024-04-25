import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/screens/main_application/navigation_pages/profile/subviews/edit_address_view.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/widgets/custom_widgets/container_with_border.dart';

class UserAddressWidget extends StatelessWidget {
  final String phoneNumberOfUser,
  nameOfUser,
  addressOfUser;
  final bool isSelected;

  const UserAddressWidget({
    super.key,
    required this.addressOfUser,
    required this.nameOfUser,
    required this.phoneNumberOfUser,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const EditAddressView()),
      child: CustomRoundedContainerWithBorder(
        showBackgroundColor: true,
        color: isSelected ? blueColor.withOpacity(0.4) : null,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: isSelected ? const Icon(Iconsax.tick_circle,) : const SizedBox.shrink()
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nameOfUser,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Gap(10),
                Text(
                  phoneNumberOfUser,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Gap(10),
                Text(
                  addressOfUser,
                  style: Theme.of(context).textTheme.bodyMedium
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}