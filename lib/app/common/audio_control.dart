import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/audio/audio_handler.dart';
import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/common/music_manager.dart';
import 'package:beemusic/app/model/response/discover/detail_discover_respon.dart';
import 'package:beemusic/app/model/response/tophits/detail_tophits_respon.dart';
import 'package:beemusic/app/utils/constant/enum.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:audio_session/audio_session.dart';

class Controls<T> extends StatelessWidget {
  const Controls(
      {super.key,
      required this.audioPlayer,
      this.home = false,
      this.detailPlayer = false,
      this.data,
      this.dataEnum,
      this.musicInitializationManager});
  final AudioPlayer audioPlayer;
  final bool home;
  final bool detailPlayer;
  final T? data;
  final String? dataEnum;
  final MusicInitializationManager? musicInitializationManager;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!musicInitializationManager!.isInitialized &&
            dataEnum == JenisMusic.discovery.text) {
          // Check if the audio player is not playing
          if (audioPlayer.playing != true) {
            print("Initializing music discovery...");
            initMusicDiscovery(data as T);
            musicInitializationManager!.markInitialized();
          } else if (!musicInitializationManager!.isInitialized &&
              dataEnum == JenisMusic.topHits.text) {
            // Check if the audio player is not playing
            if (audioPlayer.playing != true) {
              print("Initializing music tophits...");
              initMusicTopHits(data as T);
              musicInitializationManager!.markInitialized();
            }
          }
        }
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return home
              ? CircularProgressIndicator(
                  color: AppColor.kPrimaryColor,
                )
              : Column(
                  children: [
                    CircularProgressIndicator(
                      color: AppColor.kPrimaryColor,
                    ),
                    spaceHeight02,
                    const Text("Sedang menyiapkan Audio..."),
                  ],
                );
        } else if (playing != true) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              detailPlayer == true
                  ? IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: () {
                        if (audioPlayer.hasPrevious) {
                          audioPlayer.seekToPrevious();
                          getCurrentTrackTitle();
                          getCurrentTrackArtist();
                          getCurrentTrackImageUri();
                        }
                      },
                    )
                  : const SizedBox(),
              Bounceable(
                  onTap: audioPlayer.play,
                  child: CircleAvatar(
                    backgroundColor: AppColor.kPrimaryColor,
                    radius: home ? 20 : 28,
                    child: Icon(
                      Icons.play_arrow,
                      size: home ? 20 : 40,
                      color: AppColor.kWhiteColor,
                    ),
                  )),
              detailPlayer == true
                  ? IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed: () {
                        if (audioPlayer.hasNext) {
                          audioPlayer.seekToNext();
                          getCurrentTrackTitle();
                          getCurrentTrackArtist();
                          getCurrentTrackImageUri();
                        }
                      },
                    )
                  : const SizedBox(),
            ],
          );
        } else if (processingState != ProcessingState.completed) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              detailPlayer == true
                  ? IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: () {
                        if (audioPlayer.hasPrevious) {
                          audioPlayer.seekToPrevious();
                          getCurrentTrackTitle();
                          getCurrentTrackArtist();
                          getCurrentTrackImageUri();
                        }
                      },
                    )
                  : const SizedBox(),
              Bounceable(
                onTap: audioPlayer.pause,
                child: CircleAvatar(
                  backgroundColor: AppColor.kPrimaryColor,
                  radius: home ? 20 : 28,
                  child: Icon(
                    Icons.pause,
                    size: home ? 20 : 40,
                    color: AppColor.kWhiteColor,
                  ),
                ),
              ),
              detailPlayer == true
                  ? IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed: () {
                        if (audioPlayer.hasNext) {
                          audioPlayer.seekToNext();
                          getCurrentTrackTitle();
                          getCurrentTrackArtist();
                          getCurrentTrackImageUri();
                        }
                      },
                    )
                  : const SizedBox(),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              detailPlayer == true
                  ? IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed: () {
                        if (audioPlayer.hasPrevious) {
                          audioPlayer.seekToPrevious();
                          getCurrentTrackTitle();
                          getCurrentTrackArtist();
                          getCurrentTrackImageUri();
                        }
                      },
                    )
                  : const SizedBox(),
              IconButton(
                icon: Icon(
                  Icons.replay,
                  color: AppColor.kPrimaryColor,
                ),
                iconSize: home ? 25 : 50.0,
                onPressed: () => audioPlayer.seek(Duration.zero),
              ),
              detailPlayer == true
                  ? IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed: () {
                        if (audioPlayer.hasNext) {
                          audioPlayer.seekToNext();
                          getCurrentTrackTitle();
                          getCurrentTrackArtist();
                          getCurrentTrackImageUri();
                        }
                      },
                    )
                  : const SizedBox(),
            ],
          );
        }
      },
    );
  }

  Future<void> initMusicDiscovery(T datas) async {
    if (datas is DetailDiscoverResponModel) {
      final DetailDiscoverResponModel data = datas;

      try {
        // Inform the operating system of our app's audio attributes, etc.
        final session = await AudioSession.instance;
        await session.configure(const AudioSessionConfiguration.speech());

        // Listen to errors during playback.
        audioPlayerService.playbackEventStream.listen((event) {},
            onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });

        if (data.detailDiscover.isNotEmpty &&
            data.detailDiscover.first.lagu.isNotEmpty) {
          String url =
              "${EndPoints.baseURL}${data.detailDiscover.first.lagu[0].url}";

          final playlist = ConcatenatingAudioSource(children: [
            AudioSource.uri(
              Uri.parse(url),
              tag: MediaItem(
                id: '1',
                title: data.detailDiscover.first.lagu[0].judul,
                album: data.detailDiscover.first.judul,
                artist: data.detailDiscover.first.artis,
                artUri: Uri.parse(
                    "${EndPoints.baseURL}${data.detailDiscover.first.cover}"),
              ),
            ),
          ]);

          await audioPlayerService.setAudioSource(playlist);
          print("Play");
        } else {
          print("No valid audio data found in the DetailDiscoverResponModel.");
        }
      } catch (e) {
        // Handle audio initialization error.
        print("Error initializing audio: $e");
      }
    } else {
      print("Invalid data type. Expected DetailDiscoverResponModel.");
    }
  }
}

Future<void> initMusicTopHits<T>(T datas) async {
  if (datas is DetailTopHitsResponModel) {
    final DetailTopHitsResponModel data = datas;

    try {
      // Inform the operating system of our app's audio attributes etc.
      // We pick a reasonable default for an app that plays speech.
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.speech());
      // Listen to errors during playback.
      audioPlayerService.playbackEventStream.listen((event) {},
          onError: (Object e, StackTrace stackTrace) {
        print('A stream error occurred: $e');
      });
      // Try to load audio from a source and catch any errors.
      if (data.detailTopHits.isNotEmpty &&
          data.detailTopHits.first.lagu.isNotEmpty) {
        String url = "${EndPoints.baseURL}${data.detailTopHits.first.url}";

        final playlist = ConcatenatingAudioSource(children: [
          AudioSource.uri(
            Uri.parse(url),
            tag: MediaItem(
              id: '1',
              title: data.detailTopHits.first.judul,
              album: data.detailTopHits.first.judul,
              artist: data.detailTopHits.first.artis,
              artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
            ),
          ),
        ]);
        await audioPlayerService.setAudioSource(playlist);
        print("Play");
      }
    } catch (e) {
      // Handle audio initialization error.
      print("Error initializing audio: $e");
    }
  } else {
    print("Invalid data type. Expected DetailDiscoverResponModel.");
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
  PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );
}
