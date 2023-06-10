import 'package:modern_music_player/constants/constants.dart';
import 'package:modern_music_player/models/navigator_tab.dart';

class NavigatorTabData {
  static List<NavigatorTabModel> tabs = [
    NavigatorTabModel(
        path: '${Constants.assetIconsDir}/home.png'),
    NavigatorTabModel(
        path: '${Constants.assetIconsDir}/search.png'),
    NavigatorTabModel(
        path: '${Constants.assetIconsDir}/music.png'),
    NavigatorTabModel(
        path: '${Constants.assetIconsDir}/favourite.png'),
    NavigatorTabModel(
        path: '${Constants.assetIconsDir}/settings.png'),
  ];
}