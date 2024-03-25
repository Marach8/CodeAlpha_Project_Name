import 'package:campus_connect/src/utils/constants/fontsizes.dart';
import 'package:campus_connect/src/utils/constants/fontweights.dart';
import 'package:campus_connect/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SchedulesView extends StatelessWidget {
  const SchedulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericText(
      fontSize: fontSize4,
      fontWeight: fontWeight5,
      text: 'Your schedules will appear here.',
    );
  }
}