import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/backend/user/user_controller.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/utils/functions/textformfield_validator_functions.dart';
import 'package:shop_all/src/widgets/custom_widgets/app_bar_title_text.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';

class ChangeNameOfUserView extends StatelessWidget {
  const ChangeNameOfUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: CustomAppbarTitleText(title: changeNameString),
      ),

      body: Form(
        key: controller.updateUserFullNameFormKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              changeNameInstructionString,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Gap(30),
            TextFormField(
              validator: (value) => validateForm(value: value),
              controller: controller.firstNameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user),
                labelText: firstNameString
              ),
            ),
            const Gap(20),
            TextFormField(
              validator: (value) => validateForm(value: value),
              controller: controller.lastNameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user),
                labelText: lastNameString
              ),
            ),
            const Gap(30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async => await controller.updateUserFullName(),
                child: const Text(saveString),
              ),
            )
          ],
        ),
      )
    );
  }
}