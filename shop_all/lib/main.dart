import 'package:flutter/material.dart';
import 'package:shop_all/src/utils/constants/colors.dart';
import 'package:shop_all/src/utils/themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const MyHomepage(),
    );
  }
}


class MyHomepage extends StatelessWidget {
  const MyHomepage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: whiteColor
      ),
    );
  }
}