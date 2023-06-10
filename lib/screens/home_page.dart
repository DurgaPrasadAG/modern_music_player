import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modern_music_player/controller/favourites_controller.dart';
import 'package:modern_music_player/controller/music_controller.dart';
import 'package:modern_music_player/data/favourite_data.dart';
import 'package:modern_music_player/data/genre_chips_data.dart';
import 'package:modern_music_player/data/music_player_data.dart';

import '../components/heading.dart';
import '../components/trending_now_rows.dart';
import '../constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const id = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? value = 0;
  late final List<MusicController> musicControllers = [];
  late final MusicPlayerData musicPlayerData;
  late final FavouritesController favouritesController;

  @override
  void initState() {
    super.initState();
    lockPortraitMode();
    initializeMusicControllers();
    musicPlayerData = MusicPlayerData();
    favouritesController = FavouritesController();
  }

  @override
  void dispose() {
    disposeMusicControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTrendingNow(),
            const SizedBox(height: 8),
            buildActionChips(),
            const SizedBox(height: 8),
            buildActionChipsSelectedSongs(),
            buildDummies()
          ],
        ),
      ),
    );
  }

  Widget buildActionChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          GenreChipData.chips.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: FilterChip(
                label: Text(GenreChipData.chips[index].text),
                onSelected: (bool selected) {
                  HapticFeedback.heavyImpact();
                  setState(() {
                    value = index;
                  });
                },
                selected: index == value ? true : false,
                showCheckmark: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildTrendingNow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HeadingWidget(text: 'Trending right now'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: Row(
              children: [
                TrendingNowWidget(
                    context: context,
                    imageName: 'trend1',
                    songName: 'Afterhours',
                    artistName: 'TroyBoi'),
                const SizedBox(
                  width: 8,
                ),
                TrendingNowWidget(
                    context: context,
                    imageName: 'trend2',
                    songName: 'Acchham',
                    artistName: 'Manisharma'),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildDummies() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            10,
            (index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.asset(
                      '${Constants.assetAudioDir}/thumbnails/${Constants.songNames[0]}.jpg',
                      width: 75,
                      height: 75,
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.none),
                ),
                title: Text(
                  'Dummy Title ${index + 1}',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                subtitle: const Row(
                  children: [
                    Icon(Icons.person_rounded, color: Colors.white54),
                    Text('Artist',
                        style: TextStyle(color: Colors.white54)),
                  ],
                ),
                trailing: const Icon(Icons.favorite_outline_rounded, size: 40, color: Colors.white,),
              );
            },
          ),
        ),
      ),
    );
  }

  void lockPortraitMode() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  void favouriteSong(int index) {
    int id = int.parse(musicPlayerData.audios[index].metas.id!);
    if (favouritesController.alreadyFavourite(id)) {
      favouritesController.unFavourite(id);
      setState(() {});
    } else {
      favouritesController.addToFavourites(id);
      setState(() {});
    }
  }

  Widget buildFavouriteIcon(int index) {
    int id = int.parse(musicPlayerData.audios[index].metas.id!);
    if (FavouritesData.songs.contains(id)) {
      return const Icon(Icons.favorite, size: 40, color: Colors.white,);
    } else {
      return const Icon(Icons.favorite_outline_rounded, size: 40, color: Colors.white);
    }
  }

  Widget buildActionChipsSelectedSongs() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            3,
                (index) => ListTile(
              onTap: () {
                musicPlayPause(index);
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.asset(
                    '${Constants.assetAudioDir}/thumbnails/${Constants.songNames[index]}.jpg',
                    width: 75,
                    height: 75,
                    fit: BoxFit.fitWidth,
                    filterQuality: FilterQuality.low),
              ),
              title: Text(
                Constants.songNames[index],
                style:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  const Icon(Icons.person_rounded, color: Colors.white54),
                  Text(
                    musicPlayerData.audios[index].metas.artist!,
                    style: const TextStyle(color: Colors.white54),
                  ),
                ],
              ),
              trailing: TextButton(
                  onPressed: () {
                    favouriteSong(index);
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      alignment: Alignment.centerRight),
                  child: buildFavouriteIcon(index)
              ),
            ),
          ),
        ),
      ),
    );
  }

  void musicPlayPause(int index) {
    if (!musicControllers[index].isAudioPlaying()) {
      musicControllers[index].playMusic(index);
    } else {
      musicControllers[index].pauseMusic();
    }
  }

  void initializeMusicControllers() {
    for (int i = 0; i < 3; i++) {
      musicControllers.add(MusicController());
    }
  }

  void disposeMusicControllers() {
    for (int i = 0; i < 3; i++) {
      musicControllers[i].dispose();
    }
  }
}