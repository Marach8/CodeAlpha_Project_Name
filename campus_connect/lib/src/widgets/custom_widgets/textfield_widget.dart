import 'package:campus_connect/src/utils/constants/colors.dart';
import 'package:campus_connect/src/utils/constants/fontsizes.dart';
import 'package:campus_connect/src/utils/constants/fontweights.dart';
import 'package:campus_connect/src/utils/extensions/decorate_textstyle.dart';
import 'package:flutter/material.dart';


class GenericTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final Widget? leadingWidget,
  suffixIcon;
  final FocusNode? focusNode;

  const GenericTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.leadingWidget,
    this.obscureText,
    this.suffixIcon,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: controller,
      maxLines: 1,
      focusNode: focusNode,
      cursorColor: blackColor,
      obscureText: obscureText ?? false,
      cursorWidth: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        isDense: true,
        labelStyle: const TextStyle().decorateTextStyle(
          color: blackColor.withOpacity(0.2),
          fontWeight: fontWeight4,
          fontSize: fontSize3half
        ),
        floatingLabelStyle: const TextStyle().decorateTextStyle(
          color: blackColor.withOpacity(0.6),
          fontWeight: fontWeight4,
          fontSize: fontSize4,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: redColor
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: blackColor.withOpacity(0.1)
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(hintText),
        suffixIcon: suffixIcon,
        prefixIcon: leadingWidget
      ),
      style: const TextStyle().decorateTextStyle(
        color: blackColor.withOpacity(0.7),
        fontWeight: fontWeight5,
        fontSize: fontSize3half,
      ),
    );
  }
}



class GenericTextField2 extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final EdgeInsetsGeometry padding;

  const GenericTextField2({
    super.key,
    required this.hintText,
    required this.controller,
    required this.padding
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null,
      cursorColor: blackColor,             
      cursorWidth: 1,
      decoration: InputDecoration(
        hintText: hintText,
        
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: redColor
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: redColor
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: padding
      ),
      style: const TextStyle().decorateTextStyle(
        color: blackColor.withOpacity(0.5),
        fontWeight: fontWeight5,
        fontSize: fontSize3,
      ),
    );
  }
}