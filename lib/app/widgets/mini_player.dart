import 'package:beemusic/app/audio/audio_handler.dart';
import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/common/audio_control.dart';
import 'package:beemusic/app/common/music_manager.dart';
import 'package:beemusic/app/extension/navigation.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/widgets/music_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({
    super.key,
  });

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  void initState() {
    initAudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        // context.pushNamed(DetailMusicScreen.id);
        _showFullScreenBottomSheet(context);
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: Colors.grey,
          // width: deviceSize.width,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    ValueListenableBuilder<Uri?>(
                      valueListenable: currentTrackImageUri,
                      builder: (context, imageUri, child) {
                        if (imageUri != null) {
                          return CachedNetworkImage(
                            imageUrl: imageUri.toString(),
                            fit: BoxFit.cover,
                          );
                        } else {
                          // Tampilkan placeholder atau tindakan lain jika URI gambar tidak tersedia.
                          return const Text(
                              ""); // Gantilah ini dengan widget sesuai kebutuhan.
                        }
                      },
                    ),
                    spaceWidth02,
                    ValueListenableBuilder<String>(
                      valueListenable: currentTrackTitle,
                      builder: (context, trackTitle, child) {
                        return Text(
                          trackTitle,
                          style: const TextStyle(fontSize: 20),
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: sizeRight01 * 3,
                child: Controls(
                  audioPlayer: audioPlayerService,
                  home: true,
                  musicInitializationManager: MusicInitializationManager(),
                ),
              )
            ],
          )),
    );
  }

  void _showFullScreenBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: true,
      // showDragHandle: true,
      useSafeArea: true,
      enableDrag: true,

      context: context,
      isScrollControlled: true, // Set this to true to enable fullscreen
      builder: (BuildContext context) {
        return const DetailMusicScreen();
      },
    );
  }
}
