import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:modern_music_player/constants/constants.dart';
import 'package:modern_music_player/controller/favourites_controller.dart';
import 'package:modern_music_player/data/favourite_data.dart';
import 'package:modern_music_player/data/music_player_data.dart';

import '../components/heading.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  static const id = '/favourites';

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  late final FavouritesController favouritesController;

  @override
  void initState() {
    super.initState();
    favouritesController = FavouritesController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const HeadingWidget(text: 'Favourites'),
            if (FavouritesData.songs.isNotEmpty)
              Expanded(
                // Displays only two columns.
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  children: buildFavourites(),
                ),
              )
            else
              const Center(
                child: HeadingWidget(text: 'Favourites not added.'),
              ),
          ],
        ),
      ),
    );
  }

  // Fetch Favourite songs and Display.
  buildFavourites() {
    List<Audio> audios = MusicPlayerData().audios;
    return List.generate(FavouritesData.songs.length, (index) {
      bool value = false;
      Metas? meta;

      for (var ele in audios) {
        value = int.parse(ele.metas.id!) == FavouritesData.songs[index] ? true : false;
        if (value) {
          meta = ele.metas;
          break;
        }
      }

      if (value) {
        return Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      '${Constants.assetAudioDir}/thumbnails/${Constants
                          .songNames[FavouritesData.songs[index]]}.jpg',
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.black26,
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          int id = FavouritesData.songs[index];
                          unfavouriteSong(id);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(meta!.title!, style: const TextStyle(fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  '${Constants.assetIconsDir}/user.png',
                  color: Colors.white54,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 8,),
                Text(
                  meta.artist!, style: const TextStyle(color: Colors.white54),),
              ],
            )
          ],
        );
      } else {

        return const SizedBox();
      }
    });
  }

  // Removes from the favourite songs
  void unfavouriteSong(int id) {
    setState(() {
      favouritesController.unFavourite(id);
    });
  }
}
