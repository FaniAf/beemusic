import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/bloc/music/song/detail/detail_song_cubit.dart';
import 'package:beemusic/app/bloc/music/song/detail/detail_song_state.dart';
import 'package:beemusic/app/model/response/song/detail_song_respon.dart';
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

class DetailSongScreen extends StatefulWidget {
  static const id = "/detail_song_screen";
  final String idMusic;
  const DetailSongScreen({super.key, required this.idMusic});

  @override
  State<DetailSongScreen> createState() => _DetailSongScreenState();
}

class _DetailSongScreenState extends State<DetailSongScreen>
    with TickerProviderStateMixin {
  final DetailSongCubit _detailSongCubit = getIt<DetailSongCubit>();

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _detailSongCubit.songDetailGet(widget.idMusic);
  }

  @override
  void dispose() {
    // audioPlayerService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Song",
          style: AppStyle.blackMosTextRegulerStyle
              .copyWith(color: AppColor.kWhiteColor),
        ),
        // backgroundColor: AppColor.kPrimaryColor,
      ),
      body: BlocBuilder<DetailSongCubit, DetailSongState>(
          builder: (context, state) {
        if (state is GetDetailSongSuccess) {
          final data = state.detailSongRespon.detailSong.first;
          _initMusic(state.detailSongRespon);
          return PlayMusicWidget(
              dataCover: AppImage.kImageDefaultPosterNetwork,
              dataArtist: data.artis,
              dataJudul: data.judul,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              usePosterDefault: true,
              audioPlayer: audioPlayerService);
        } else if (state is GetDetailSongFailed) {
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
