import 'package:flutter/material.dart';
import 'package:modern_music_player/provider/change_theme_provider.dart';
import 'package:modern_music_player/screens/favourites_page.dart';
import 'package:modern_music_player/screens/home_page.dart';
import 'package:modern_music_player/screens/navigator_tab.dart';
import 'package:modern_music_player/screens/search_page.dart';
import 'package:modern_music_player/screens/settings_page.dart';
import 'package:modern_music_player/theme/background_colors.dart';
import 'package:modern_music_player/theme/theming.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ModernMusicPlayer());
}

class ModernMusicPlayer extends StatelessWidget {
  const ModernMusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChangeThemeProvider(),
      child: Consumer<ChangeThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ModernMusicPlayerTheme().darkTheme(color: BackgroundColorsData
                .colors[StaticTheme.themeSelectedIndex].color),
            home: const NavigatorPage(),
            routes: {
              NavigatorPage.id: (context) => const NavigatorPage(),
              HomePage.id: (context) => const HomePage(),
              SearchPage.id: (context) => const SearchPage(),
              FavouritesPage.id: (context) => const FavouritesPage(),
              SettingsPage.id: (context) => const SettingsPage()
            },
          );
        },
      ),
    );
  }
}
