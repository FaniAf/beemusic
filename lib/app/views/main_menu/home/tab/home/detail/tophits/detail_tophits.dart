import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/bloc/music/tophits/detail/detail_tophits_cubit.dart';
import 'package:beemusic/app/bloc/music/tophits/detail/detail_tophits_state.dart';
import 'package:beemusic/app/model/response/tophits/detail_tophits_respon.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/constant/enum.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:beemusic/app/widgets/play_music.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audio_session/audio_session.dart';

class DetailTopHitsScreen extends StatefulWidget {
  static const id = "/detail_tophits_screen";
  final String idMusic;
  const DetailTopHitsScreen({super.key, required this.idMusic});

  @override
  State<DetailTopHitsScreen> createState() => _DetailTopHitsScreenState();
}

class _DetailTopHitsScreenState extends State<DetailTopHitsScreen>
    with TickerProviderStateMixin {
  final DetailTopHitsCubit _detailTopHitsCubit = getIt<DetailTopHitsCubit>();
  // final _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _detailTopHitsCubit.topHitsDetailGet(widget.idMusic);
  }

  @override
  void dispose() {
    // _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Hits",
          style: AppStyle.blackMosTextRegulerStyle
              .copyWith(color: AppColor.kWhiteColor),
        ),
        // backgroundColor: AppColor.kPrimaryColor,
      ),
      body: BlocBuilder<DetailTopHitsCubit, DetailTopHitsState>(
          builder: (context, state) {
        if (state is GetDetailTopHitsSuccess) {
          final data = state.detailTopHitsRespon.detailTopHits.first;
          // _initMusic(state.detailTopHitsRespon);
          return PlayMusicWidget(
              dataCover: AppImage.kImageDefaultPosterNetwork,
              dataEnum: JenisMusic.topHits.text,
              data: state.detailTopHitsRespon,
              dataArtist: data.artis,
              dataJudul: data.judul,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              usePosterDefault: true,
              audioPlayer: audioPlayerService);
        } else if (state is GetDetailTopHitsFailed) {
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
}
