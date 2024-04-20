import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RowWithTwoTextFormFields extends StatelessWidget {
  final IconData icon1, icon2;
  final String hintText1, hintText2;
  final TextEditingController? controller1, controller2;
  final String? Function(String? value)? validator1, validator2;

  const RowWithTwoTextFormFields({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.hintText1,
    required this.hintText2,
    this.validator1,
    this.validator2,
    this.controller1,
    this.controller2
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
            controller: controller1,
            validator: validator1,
            decoration: InputDecoration(
              prefixIcon: Icon(icon1),
              labelText: hintText1
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: TextFormField(
            controller: controller2,
            validator: validator2,
            decoration: InputDecoration(
              prefixIcon: Icon(icon2),
              labelText: hintText2
            ),
          ),
        ),
      ],
    );
  }
}