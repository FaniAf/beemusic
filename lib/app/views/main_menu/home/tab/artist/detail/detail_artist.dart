import 'package:beemusic/app/audio/audio_handler.dart';
import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/bloc/music/artist/detail/detail_artist_cubit.dart';
import 'package:beemusic/app/bloc/music/artist/detail/detail_artist_state.dart';
import 'package:beemusic/app/extension/navigation.dart';
import 'package:beemusic/app/model/response/album/detail_album_respon.dart';
import 'package:beemusic/app/model/response/artist/detail_artist_respon.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/views/main_menu/home/tab/album/detail/detail_album.dart';
import 'package:beemusic/app/widgets/cover_card.dart';
import 'package:beemusic/app/widgets/custom_title.dart';
import 'package:beemusic/app/widgets/listile_widget.dart';
import 'package:beemusic/app/widgets/mini_player.dart';
import 'package:flutter/material.dart';
import 'package:beemusic/app/model/response/song/detail_song_respon.dart';
import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:beemusic/app/widgets/play_music.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audio_session/audio_session.dart';

class DetailArtistScreen extends StatefulWidget {
  static const id = "/detail_artist_screen";
  final String idMusic;
  const DetailArtistScreen({super.key, required this.idMusic});

  @override
  State<DetailArtistScreen> createState() => _DetailArtistScreenState();
}

class _DetailArtistScreenState extends State<DetailArtistScreen>
    with TickerProviderStateMixin {
  final DetailArtistCubit _detailArtistCubit = getIt<DetailArtistCubit>();

  @override
  void initState() {
    super.initState();
    _detailArtistCubit.detailArtistGet(widget.idMusic);
  }

  @override
  void dispose() {
    //audioPlayerService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder<bool>(
        valueListenable: isAudioPlayingNotifier,
        builder: (context, isPlaying, child) {
          // initAudioPlayer();
          // Bangun UI yang perlu diperbarui berdasarkan isPlaying
          return isPlaying ? const MiniPlayer() : const SizedBox();
        },
      ),
      appBar: AppBar(
        title: Text(
          "Artist",
          style: AppStyle.blackMosTextRegulerStyle
              .copyWith(color: AppColor.kWhiteColor),
        ),
        // backgroundColor: AppColor.kPrimaryColor,
      ),
      body: BlocBuilder<DetailArtistCubit, DetailArtistState>(
          builder: (context, state) {
        if (state is GetDetailArtistSuccess) {
          final data = state.detailartistRespon;
          // _initMusic(state.detailartistRespon);
          return Padding(
            padding: sizePadding,
            child: Column(
              children: [
                const CustomTitle(text: "Album"),
                spaceHeight02,
                SizedBox(
                    height: 150,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: data.detailArtist.first.album.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Bounceable(
                                onTap: () {
                                  print(
                                      data.detailArtist.first.album[index].id);
                                  context.pushNamed(DetailAlbumScreen.id,
                                      arguments: data
                                          .detailArtist.first.album[index].id
                                          .toString());
                                },
                                child: PosterCard(
                                    imageUrl:
                                        "${EndPoints.baseURL}${data.detailArtist[0].urlPhoto}"),
                              ),
                              spaceWidth02
                            ],
                          );
                        })),
                spaceHeight02,
                const CustomTitle(text: "Lagu"),
                spaceHeight02,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.detailArtist[0].lagu.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTileWidgetMusic(
                        listLagunya: data.detailArtist[0].lagu,
                        song: data.detailArtist[0].lagu[index],
                        index: index);
                  },
                ),
              ],
            ),
          );
          // PlayMusicWidget(
          //     dataCover: AppImage.kImageDefaultPosterNetwork,
          //     dataArtist: data.nama,
          //     dataJudul: data.lagu[0].judul,
          //     screenHeight: screenHeight,
          //     screenWidth: screenWidth,
          //     usePosterDefault: true,
          //     audioPlayer: audioPlayerService);
        } else if (state is GetDetailArtistFailed) {
          return Text(state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
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

  Future<void> _initMusic(DetailArtistResponModel data) async {
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
      String url = "${EndPoints.baseURL}${data.detailArtist[0].lagu[0].url}";

      final playlist = ConcatenatingAudioSource(children: [
        AudioSource.uri(
          Uri.parse(url),
          tag: MediaItem(
            id: '1',
            title: data.detailArtist.first.lagu[0].judul,
            album: data.detailArtist.first.album[0].judul,
            artist: data.detailArtist.first.nama,
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
