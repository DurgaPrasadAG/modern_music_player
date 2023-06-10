import 'package:assets_audio_player/assets_audio_player.dart';

import '../data/music_player_data.dart';

class MusicController {
  late final AssetsAudioPlayer _assetsAudioPlayer;
  late final MusicPlayerData musicPlayerData;

  MusicController() {
    _initializeAudioPlayer();
    musicPlayerData = MusicPlayerData();
  }

  void _initializeAudioPlayer() {
    _assetsAudioPlayer = AssetsAudioPlayer();
  }

  void dispose() {
    _assetsAudioPlayer.dispose();
  }

  void playMusic(int index) {
    _assetsAudioPlayer.open(musicPlayerData.audios[index]);
    _assetsAudioPlayer.play();
  }

  void pauseMusic() {
    _assetsAudioPlayer.pause();
  }

  bool isAudioPlaying() {
    return (_assetsAudioPlayer.isPlaying.value == true) ? true : false;
  }
}