import 'package:flutter/cupertino.dart';
import 'package:shop_all/src/utils/constants/strings/text_strings.dart';

extension DecorateTextSpan on TextSpan{
  TextSpan decorateTextSpan({
    required Color color, 
    required FontWeight fontWeight,
    required double fontSize,
    bool? controlOverflow
  }) => TextSpan(
    text: text,
    recognizer: recognizer,
    style: TextStyle(
      fontFamily: quickSandFont,
      color: color, 
      fontSize: fontSize,
      fontWeight: fontWeight,
      overflow: controlOverflow ?? false ? TextOverflow.ellipsis : null,
    )
  );
}