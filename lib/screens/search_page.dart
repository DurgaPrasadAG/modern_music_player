import 'package:flutter/material.dart';
import 'package:modern_music_player/components/not_impl_action.dart';
import 'package:modern_music_player/constants/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const id = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () {
                  NotImplementedAction(context: context);
                },
                child: Image.asset(
                  '${Constants.assetIconsDir}/filter.png',
                  color: Colors.white54,
                  height: 64,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Image.asset(
                          '${Constants.assetIconsDir}/search.png',
                          color: Colors.white54),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(32)),
                      filled: true,
                      fillColor: Theme.of(context).primaryColor,
                      isDense: true,
                      labelStyle:
                          const TextStyle(color: Colors.white54, fontSize: 20)),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
