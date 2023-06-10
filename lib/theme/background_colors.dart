import 'package:flutter/material.dart';

class BackgroundColorsModel {
  late final Color color;
  late final String shade;

  BackgroundColorsModel({required this.color, required this.shade});
}

class StaticTheme {
  static int themeSelectedIndex = 0;
}

class BackgroundColorsData {

  static List<BackgroundColorsModel> colors = [
    BackgroundColorsModel(color: const Color(0xff0b0015), shade: 'Dark purple'),
    BackgroundColorsModel(color: const Color(0xff550080), shade: 'Shade 1'),
    BackgroundColorsModel(color: const Color(0xff3c005a), shade: 'Shade 2'),
    BackgroundColorsModel(color: const Color(0xff800060), shade: 'Shade 3'),
    BackgroundColorsModel(color: const Color(0xff2b0080), shade: 'Shade 4'),
    BackgroundColorsModel(color: const Color(0xff1e005a), shade: 'Shade 5'),
  ];
}