
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/constants/font_sizes.dart';
import 'package:shop_all/src/utils/constants/font_weights.dart';
import 'package:shop_all/src/utils/extensions/decorate_textspan.dart';
import 'package:shop_all/src/utils/functions/helper_functions.dart';

class RichTextWidget extends StatelessWidget {
  final List<dynamic> children;

  const RichTextWidget({
    super.key,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: children.map(
            (child) {
              if(child is List){
                final text = child.first as String;
                final function = child.last as void Function();
      
                return TextSpan(
                  text: text,
                  recognizer: TapGestureRecognizer()..onTap = function,
                ).decorateTextSpan(
                  color: blueColor,
                  fontWeight: fontWeight7,
                  fontSize: fontSize3
                );
              }
      
              return TextSpan(
                text: child as String
              ).decorateTextSpan(
                color: isInDarkMode(context) ? whiteColor : blackColor,
                fontWeight: fontWeight4,
                fontSize: fontSize3
              );
            }
          ).toList()
        )
      ),
    );
  }
}
