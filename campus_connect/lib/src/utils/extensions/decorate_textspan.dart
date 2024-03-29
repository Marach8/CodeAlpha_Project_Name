import 'package:campus_connect/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

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