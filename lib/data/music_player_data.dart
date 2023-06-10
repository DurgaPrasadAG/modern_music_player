import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:modern_music_player/constants/constants.dart';

class MusicPlayerData {
  late final List<String> _assetsSongsPaths;
  late final List<Audio> audios;

  MusicPlayerData() {
    // Asset song path
    _assetsSongsPaths = [
      '${Constants.assetDir}/audio_files/${Constants.songNames[0]}.m4a',
      '${Constants.assetDir}/audio_files/${Constants.songNames[1]}.m4a',
      '${Constants.assetDir}/audio_files/${Constants.songNames[2]}.m4a'
    ];
    _audioFiles();
  }

  /*
    List of Audio files in the asset directory with metadata.
   */
  void _audioFiles() {
    audios = <Audio>[
      Audio(
        _assetsSongsPaths[0],
        metas: Metas(
          id: '0',
          title: Constants.songNames[0],
          artist: 'Badshaah',
          album: 'Baar Baar Dekho',
        ),
      ),
      Audio(
        _assetsSongsPaths[1],
        metas: Metas(
          id: '1',
          title: Constants.songNames[1],
          artist: 'Manisharma',
          album: 'Khaaleja',
        ),
      ),
      Audio(
        _assetsSongsPaths[2],
        metas: Metas(
          id: '2',
          title: Constants.songNames[2],
          artist: 'Arjit Singh',
          album: 'Brahmastra',
        ),
      ),
    ];
  }
}