import 'package:campus_connect/src/screens/sub_views/bottom_sheet_for_landing_screen.dart';
import 'package:campus_connect/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:campus_connect/src/screens/sub_views/landing_screen_page_view.dart';
import 'package:flutter/material.dart';


class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenericAnnotatedRegion(
      changeStatusBarIconBrightness: true,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: LandingScreenPageView(),
            ),
            Expanded(
              flex: 1,
              child: BottomSheetForLandingScreen(),
            )
          ],
        ),
      ),
    );
  }
}