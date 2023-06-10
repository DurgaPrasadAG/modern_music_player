import 'package:assets_audio_player/assets_audio_player.dart';

import '../data/music_player_data.dart';

class MusicController {
  late final AssetsAudioPlayer _assetsAudioPlayer;
  late final MusicPlayerData musicPlayerData;

  MusicController() {
    _initializeAudioPlayer();
    musicPlayerData = MusicPlayerData();
  }

  /*
      Initializes the audio player.
   */
  void _initializeAudioPlayer() {
    _assetsAudioPlayer = AssetsAudioPlayer();
  }

  ///Dispose the resources
  void dispose() {
    _assetsAudioPlayer.dispose();
  }

  ///  Plays music.
  ///  Needs [index] of audio from audios list.
  void playMusic(int index) {
    _assetsAudioPlayer.open(musicPlayerData.audios[index]);
    _assetsAudioPlayer.play();
  }

  /// Pause music.
  void pauseMusic() {
    _assetsAudioPlayer.pause();
  }

  /// Returns true if music is playing.
  bool isAudioPlaying() {
    return (_assetsAudioPlayer.isPlaying.value == true) ? true : false;
  }
}