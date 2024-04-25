import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/row_with_two_textformfields.dart';

class EditAddressView extends StatelessWidget {
  const EditAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Edit Your Address',
          style: Theme.of(context).textTheme.headlineMedium
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: nameString
                  ),
                ),
                const Gap(10),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: phoneString
                  ),
                ),
                const Gap(10),
                const RowWithTwoTextFormFields(
                  icon1: Iconsax.battery_3full,
                  icon2: Iconsax.pen_add,
                  hintText1: streetString,
                  hintText2: postalCodeString
                ),
                const Gap(10),
                const RowWithTwoTextFormFields(
                  icon1: Iconsax.battery_3full,
                  icon2: Iconsax.pen_add,
                  hintText1: cityString,
                  hintText2: stateString
                ),
                const Gap(10),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: countryString
                  ),
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: const Text(saveString),
                  ),
                )
              ],
            ),
          ),
        )
      )
    );
  }
}