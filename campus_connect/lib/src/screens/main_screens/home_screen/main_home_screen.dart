import 'package:campus_connect/src/screens/main_screens/drawer_screen.dart';
import 'package:campus_connect/src/utils/constants/colors.dart';
import 'package:campus_connect/src/utils/constants/fontsizes.dart';
import 'package:campus_connect/src/utils/constants/fontweights.dart';
import 'package:campus_connect/src/utils/constants/strings.dart';
import 'package:campus_connect/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:campus_connect/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GenericAnnotatedRegion(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hello')
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                unselectedLabelColor: blackColor,
                dividerColor: whiteColor,
                indicatorColor: redColor,
                splashBorderRadius: const BorderRadius.all(Radius.circular(100)),
                dividerHeight: 0,
                overlayColor: MaterialStatePropertyAll(redColor.withOpacity(0.5)),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.home_max_outlined),
                    iconMargin: EdgeInsets.zero,
                    child: GenericText(
                      fontSize: fontSize2half,
                      fontWeight: fontWeight5,
                      text: homeString
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.home_max_outlined),
                    iconMargin: EdgeInsets.zero,
                    child: GenericText(
                      fontSize: fontSize2half,
                      fontWeight: fontWeight5,
                      text: homeString
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.home_max_outlined),
                    iconMargin: EdgeInsets.zero,
                    child: GenericText(
                      fontSize: fontSize2half,
                      fontWeight: fontWeight5,
                      text: homeString
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: Text('Tab1')
                    ),
                    Center(
                      child: Text('Tab2')
                    ),
                    Center(
                      child: Text('Tab3')
                    ),
                  ]
                )
              )
            ],
          )
        ),
        drawer: const DrawerScreen(),
      ),
    );
  }
}