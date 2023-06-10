import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:modern_music_player/data/navigator_tab_data.dart';
import 'package:modern_music_player/screens/favourites_page.dart';
import 'package:modern_music_player/screens/home_page.dart';
import 'package:modern_music_player/screens/search_page.dart';
import 'package:modern_music_player/screens/settings_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  static const id = '/navigator';

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  Color? tabColor = Colors.white;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          buildTabBarView(),
          Positioned(bottom: 15, child: buildBottomNavigationBar()),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            padding: const EdgeInsets.all(8),
            child: TabBar(
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.white54, width: 2.0),
              ),
              indicatorColor: Colors.white54,
              dividerColor: Colors.transparent,
              controller: tabController,
              enableFeedback: true,
              tabs: List.generate(NavigatorTabData.tabs.length, (index) {
                return Tab(child: Image.asset(NavigatorTabData.tabs[index].path, color: Colors.white,));
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTabBarView() {
    return TabBarView(
      controller: tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePage(),
        SearchPage(),
        Center(child: Text('Music Page Not Implemented')),
        FavouritesPage(),
        SettingsPage(),
      ],
    );
  }
}