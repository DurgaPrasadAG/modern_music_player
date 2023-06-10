import 'package:flutter/material.dart';

class ModernMusicPlayerTheme {

  ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      chipTheme: ChipThemeData(
        side: BorderSide.none,
        elevation: 8,
        selectedColor: ColorScheme.fromSeed(seedColor: Colors.deepPurple).primary,
      ),
      scaffoldBackgroundColor: const Color(0xff0b0015),
      useMaterial3: true,
    );
  }
}