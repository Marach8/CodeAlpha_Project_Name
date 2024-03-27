import 'package:flutter/material.dart';

bool isInDarkMode(BuildContext context)
  => MediaQuery.of(context).platformBrightness == Brightness.dark;