import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:beemusic/app/audio/audio_handler.dart';
import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/bloc/music/song/detail/detail_song_cubit.dart';
import 'package:beemusic/app/bloc/music/song/detail/detail_song_state.dart';
import 'package:beemusic/app/common/audio_control.dart';
import 'package:beemusic/app/common/music_manager.dart';
import 'package:beemusic/app/model/response/song/detail_song_respon.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/widgets/shimmer_home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/model/response/tophits/detail_tophits_respon.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:beemusic/app/widgets/play_music.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audio_session/audio_session.dart';

class DetailMusicScreen extends StatefulWidget {
  static const id = "/detail_music_screen";
  const DetailMusicScreen({
    super.key,
  });

  @override
  State<DetailMusicScreen> createState() => _DetailMusicScreenState();
}

class _DetailMusicScreenState extends State<DetailMusicScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: ValueListenableBuilder<String>(
            valueListenable: currentTrackArtist,
            builder: (context, trackTitle, child) {
              return Text(
                trackTitle,
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
          centerTitle: true,
          // backgroundColor: AppColor.kPrimaryColor,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: ValueListenableBuilder<Uri?>(
                valueListenable: currentTrackImageUri,
                builder: (context, imageUri, child) {
                  if (imageUri != null) {
                    return Stack(
                      children: [
                        Padding(
                          padding: sizePadding * 2 + sizePaddingvertical01,
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color:
                                      AppColor.kPrimaryColor.withOpacity(0.2),
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                  offset: const Offset(0, 0))
                            ], borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl: imageUri.toString(),
                                height: 400,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const ShimmerHome(
                                  screenHeight: 50,
                                  screenWidth: 50,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    // Tampilkan placeholder atau tindakan lain jika URI gambar tidak tersedia.
                    return const Text(
                        ""); // Gantilah ini dengan widget sesuai kebutuhan.
                  }
                },
              ),
            ),
            spaceHeight04,
            ValueListenableBuilder<String>(
              valueListenable: currentTrackTitle,
              builder: (context, trackTitle, child) {
                return Text(
                  trackTitle,
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            spaceHeight04,
            ValueListenableBuilder<Duration>(
              valueListenable: currentTrackPosition,
              builder: (context, position, _) {
                return ValueListenableBuilder<Duration?>(
                  valueListenable: currentTrackDuration,
                  builder: (context, duration, _) {
                    return Padding(
                      padding: sizePadding,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: ProgressBar(
                              bufferedBarColor:
                                  AppColor.kPrimaryColor.withOpacity(0.6),
                              barCapShape: BarCapShape.square,
                              thumbRadius: 7,
                              thumbGlowColor: Colors.transparent,
                              thumbCanPaintOutsideBar: false,
                              barHeight: 7,
                              thumbColor: AppColor.kPrimaryColor,
                              baseBarColor:
                                  AppColor.kPrimaryColor.withOpacity(0.1),
                              progressBarColor: AppColor.kPrimaryColor,
                              timeLabelPadding: 8,
                              timeLabelLocation: TimeLabelLocation.sides,
                              timeLabelTextStyle:
                                  AppStyle.primaryTextMediumStyle,
                              progress: position,
                              buffered:
                                  position, // Replace this with actual buffered position if available
                              total: duration ?? Duration.zero,
                              onSeek: (newPosition) {
                                audioPlayerService.seek(newPosition);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            spaceHeight04,
            Padding(
              padding: sizeRight01 * 3,
              child: Controls(
                audioPlayer: audioPlayerService,
                // home: true,
                detailPlayer: true,
                musicInitializationManager: MusicInitializationManager(),
              ),
            )
          ],
        ));
  }

  Future<void> _requestPermissions() async {
    final permissions = await Permission.mediaLibrary.request();
    if (permissions.isGranted) {
      // Permission granted, proceed with audio playback setup
      // await _initMusic();
    } else {
      // Permission denied, handle it (e.g., show an error message)
      print('Permission denied: ${permissions.toString()}');
      // You can display an error message or request the permission again
    }
  }

  Future<void> _initMusic(DetailSongResponModel data) async {
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
    try {
      String url = "${EndPoints.baseURL}${data.detailSong.first.url}";

      final playlist = ConcatenatingAudioSource(children: [
        AudioSource.uri(
          Uri.parse(url),
          tag: MediaItem(
            id: '1',
            title: data.detailSong.first.judul,
            album: data.detailSong.first.judul,
            artist: data.detailSong.first.artis,
            artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
          ),
        ),
      ]);
      await audioPlayerService.setAudioSource(playlist);
      print("Play");
    } catch (e) {
      // showToast("Error loading audio source");
      // _showBottomSheet(context);
      print("Error loading audio source: $e");
    }
  }
}
