import 'package:flutter/material.dart';

enum AppThemeKeys { light, dark }
final Map<AppThemeKeys, ThemeData> _themes = {
  AppThemeKeys.light: ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.blue,
    brightness: Brightness.light,
  ),
  AppThemeKeys.dark: ThemeData(
    primaryColor: Colors.green,
    accentColor: Colors.green,
    brightness: Brightness.dark,
  ),
};