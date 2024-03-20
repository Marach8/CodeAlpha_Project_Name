import 'package:campus_connect/src/utils/constants/colors.dart';
import 'package:campus_connect/src/utils/constants/fontsizes.dart';
import 'package:campus_connect/src/utils/constants/fontweights.dart';
import 'package:campus_connect/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';


class GenericElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color? color, 
  backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? noMargin;

  const GenericElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.noMargin,
    this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: noMargin ?? false ? null : const EdgeInsets.fromLTRB(50, 0, 50, 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            backgroundColor ?? blackColor
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              width: 1, 
              strokeAlign: 1, 
              color: color ?? blackColor
            )
          )
        ),
        child: GenericText(
          color: color ?? whiteColor,
          fontSize: fontSize ?? fontSize3,
          fontWeight: fontWeight ?? fontWeight5,
          text: title
        )
      ),
    );
  }
}