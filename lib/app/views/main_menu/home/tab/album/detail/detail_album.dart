import 'package:beemusic/app/audio/audio_handler.dart';
import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/bloc/music/album/detail/detail_album_cubit.dart';
import 'package:beemusic/app/bloc/music/album/detail/detail_album_state.dart';
import 'package:beemusic/app/model/response/album/detail_album_respon.dart';
import 'package:beemusic/app/widgets/listile_widget.dart';
import 'package:beemusic/app/widgets/mini_player.dart';
import 'package:flutter/material.dart';
import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:beemusic/app/widgets/play_music.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audio_session/audio_session.dart';

class DetailAlbumScreen extends StatefulWidget {
  static const id = "/detail_album_screen";
  final String idMusic;
  const DetailAlbumScreen({super.key, required this.idMusic});

  @override
  State<DetailAlbumScreen> createState() => _DetailAlbumScreenState();
}

class _DetailAlbumScreenState extends State<DetailAlbumScreen>
    with TickerProviderStateMixin {
  final DetailAlbumCubit _detailAlbumCubit = getIt<DetailAlbumCubit>();

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _detailAlbumCubit.detailAlbumGet(widget.idMusic);
  }

  @override
  void dispose() {
    //_audioPlayer.dispose();
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
          "Album",
          style: AppStyle.blackMosTextRegulerStyle
              .copyWith(color: AppColor.kWhiteColor),
        ),
        // backgroundColor: AppColor.kPrimaryColor,
      ),
      body: BlocBuilder<DetailAlbumCubit, DetailAlbumState>(
          builder: (context, state) {
        if (state is GetDetailAlbumSuccess) {
          final data = state.detailAlbumRespon.detailAlbum.first;
          // _initMusic(state.detailAlbumRespon);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.lagu.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTileWidgetMusic(
                  listLagunya: data.lagu, song: data, index: index);
            },
          );
          // PlayMusicWidget(
          //     dataCover: AppImage.kImageDefaultPosterNetwork,
          //     dataArtist: data.artis,
          //     dataJudul: data.lagu[0].judul,
          //     screenHeight: screenHeight,
          //     screenWidth: screenWidth,
          //     usePosterDefault: true,
          //     audioPlayer: audioPlayerService);
        } else if (state is GetDetailAlbumFailed) {
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

  Future<void> _initMusic(DetailAlbumResponModel data) async {
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
      String url = "${EndPoints.baseURL}${data.detailAlbum[0].lagu[0].url}";

      final playlist = ConcatenatingAudioSource(children: [
        AudioSource.uri(
          Uri.parse(url),
          tag: MediaItem(
            id: '1',
            title: data.detailAlbum.first.lagu[0].judul,
            album: data.detailAlbum.first.judul,
            artist: data.detailAlbum.first.artis,
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
