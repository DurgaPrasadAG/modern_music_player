import 'package:modern_music_player/data/favourite_data.dart';

class FavouritesController {

  void addToFavourites(int id) {
    if (!FavouritesData.songs.contains(id)) {
      FavouritesData.songs.add(id);
    }
  }

  void unFavourite(int id) {
    FavouritesData.songs.remove(id);
  }

  bool alreadyFavourite(int id)  {
    return FavouritesData.songs.contains(id);
  }
}