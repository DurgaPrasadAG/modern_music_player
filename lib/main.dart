import 'package:flutter/material.dart';
import 'package:modern_music_player/screens/favourites_page.dart';
import 'package:modern_music_player/screens/home_page.dart';
import 'package:modern_music_player/screens/navigator_tab.dart';
import 'package:modern_music_player/screens/search_page.dart';
import 'package:modern_music_player/screens/settings_page.dart';
import 'package:modern_music_player/theme/theming.dart';

void main() {
  runApp(const ModernMusicPlayer());
}

class ModernMusicPlayer extends StatelessWidget {
  const ModernMusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ModernMusicPlayerTheme().darkTheme(),
      home: const NavigatorPage(),
      routes: {
        NavigatorPage.id: (context) => const NavigatorPage(),
        HomePage.id: (context) => const HomePage(),
        SearchPage.id: (context) => const SearchPage(),
        FavouritesPage.id: (context) => const FavouritesPage(),
        SettingsPage.id: (context) => const SettingsPage()
      },
    );
  }
}