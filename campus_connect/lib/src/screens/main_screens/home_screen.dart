import 'package:campus_connect/src/widgets/custom_widgets/annotated_region_widget.dart';
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
        body: const DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    child: Text('tab1'),
                  ),
                  Tab(
                    child: Text('tab2'),
                  ),
                  Tab(
                    child: Text('tab3'),
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
        )
      ),
    );
  }
}