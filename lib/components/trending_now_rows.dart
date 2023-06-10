import 'dart:ui';

import 'package:flutter/material.dart';
import '../constants/constants.dart';

class TrendingNowWidget extends StatelessWidget {
  const TrendingNowWidget({
    super.key,
    required this.context,
    required this.imageName,
    required this.songName,
    required this.artistName,
  });

  final BuildContext context;
  final String imageName, songName, artistName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 1.75,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              '${Constants.assetImagesDir}/$imageName.jpg',
              fit: BoxFit.fill,
              filterQuality: FilterQuality.low,
              width: MediaQuery.of(context).size.width / 1.75,
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width / 1.75,
            bottom: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: ListTile(
                    title: Text(songName),
                    subtitle: Row(
                      children: [
                        Image.asset(
                          '${Constants.assetIconsDir}/music.png',
                          height: 16,
                          color: Colors.white54,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          artistName,
                          style: const TextStyle(
                            color: Colors.white54,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    trailing: const CircleAvatar(
                      child: Icon(Icons.play_arrow_rounded),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
