import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RowWithTwoTextFormFields extends StatelessWidget {
  final IconData icon1, icon2;
  final String hintText1, hintText2;

  const RowWithTwoTextFormFields({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.hintText1,
    required this.hintText2
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(icon1),
              labelText: hintText1
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: TextFormField(
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