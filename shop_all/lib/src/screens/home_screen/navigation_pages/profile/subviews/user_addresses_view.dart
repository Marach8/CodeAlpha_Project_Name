import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';
import 'package:shop_all/src/widgets/custom_widgets/appbar.dart';
import 'package:shop_all/src/widgets/custom_widgets/user_address.dart';

class UserAddressView extends StatelessWidget {
  const UserAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          myAddressesString,
          style: Theme.of(context).textTheme.headlineMedium
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to((){}),
        backgroundColor: blueColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              UserAddressWidget(
                isSelected: true,
                nameOfUser: 'Emmanuel Marach',
                phoneNumberOfUser: '08022935013',
                addressOfUser: '2C Onuiyi Road, Nsukka Enugu State Nigeria',
              ),
              Gap(10), 
              UserAddressWidget(
                isSelected: false,
                nameOfUser: 'Emmanuel Marach',
                phoneNumberOfUser: '08022935013',
                addressOfUser: '2C Onuiyi Road, Nsukka Enugu State Nigeria',
              )
            ]
          ),
        )
      )
    );
  }
}
