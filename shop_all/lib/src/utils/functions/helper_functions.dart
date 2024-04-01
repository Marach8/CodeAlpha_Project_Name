import 'package:flutter/material.dart';

bool isInDarkMode(BuildContext context)
  => MediaQuery.of(context).platformBrightness == Brightness.dark;

double getScreenHeight(BuildContext context)
  => MediaQuery.of(context).size.height;

double getScreenWidth(BuildContext context) 
  => MediaQuery.of(context).size.width;