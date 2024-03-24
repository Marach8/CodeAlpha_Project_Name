import 'package:campus_connect/src/screens/main_screens/drawer_screen.dart';
import 'package:campus_connect/src/utils/constants/colors.dart';
import 'package:campus_connect/src/utils/constants/fontsizes.dart';
import 'package:campus_connect/src/utils/constants/fontweights.dart';
import 'package:campus_connect/src/utils/constants/strings.dart';
import 'package:campus_connect/src/widgets/custom_widgets/annotated_region_widget.dart';
import 'package:campus_connect/src/widgets/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late TabController controller;
  late ValueNotifier<bool> valueNotifier;

  @override
  void initState(){
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this
    );

    valueNotifier = ValueNotifier(false);

    controller.addListener(() {
      if(controller.index == 1 || controller.index == 2){
        valueNotifier.value = true;
      }
      else{
        valueNotifier.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GenericAnnotatedRegion(
      child: Scaffold(
        appBar: AppBar(
          title: ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (_, value, __) => Visibility(
              visible: value,
              child: const GenericText(
                fontSize: fontSize2half,
                fontWeight: fontWeight5,
                text: homeString
              ),
            ),
          )
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
                    icon: FaIcon(FontAwesomeIcons.house),
                    iconMargin: EdgeInsets.zero,
                    child: GenericText(
                      fontSize: fontSize2half,
                      fontWeight: fontWeight5,
                      text: homeString
                    ),
                  ),
                  Tab(
                    icon: FaIcon(FontAwesomeIcons.clock),
                    iconMargin: EdgeInsets.zero,
                    child: GenericText(
                      fontSize: fontSize2half,
                      fontWeight: fontWeight5,
                      text: eventsString
                    ),
                  ),
                  Tab(
                    icon: FaIcon(FontAwesomeIcons.calendarDays),
                    iconMargin: EdgeInsets.zero,
                    child: GenericText(
                      fontSize: fontSize2half,
                      fontWeight: fontWeight5,
                      text: schedulesString
                    ),
                  ),
                ],
              ),
              
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: const [
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