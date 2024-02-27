import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/audio/audio_handler.dart';
import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/bloc/music/discover/detail/detail_discover_cubit.dart';
import 'package:beemusic/app/bloc/music/discover/detail/detail_discover_state.dart';
import 'package:beemusic/app/model/response/discover/detail_discover_respon.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/constant/enum.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:beemusic/app/widgets/custom_title.dart';
import 'package:beemusic/app/widgets/listile_widget.dart';
import 'package:beemusic/app/widgets/mini_player.dart';
import 'package:beemusic/app/widgets/play_music.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:audio_session/audio_session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';

class DetailDiscoverScreen extends StatefulWidget {
  static const id = "/detail_discover_screen";
  final String idMusic;
  const DetailDiscoverScreen({super.key, required this.idMusic});

  @override
  State<DetailDiscoverScreen> createState() => _DetailDiscoverScreenState();
}

class _DetailDiscoverScreenState extends State<DetailDiscoverScreen>
    with TickerProviderStateMixin {
  final DetailDiscoverCubit _detailDiscoverCubit = getIt<DetailDiscoverCubit>();

  @override
  void initState() {
    super.initState();
    // _requestPermissions();
    _detailDiscoverCubit.discoverGet(widget.idMusic);
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
          "Discover",
          style: AppStyle.blackMosTextRegulerStyle
              .copyWith(color: AppColor.kWhiteColor),
        ),
        // backgroundColor: AppColor.kPrimaryColor,
      ),
      body: BlocBuilder<DetailDiscoverCubit, DetailDiscoverState>(
          builder: (context, state) {
        if (state is GetDetailDiscoverSuccess) {
          final data = state.detailDiscoverRespon.detailDiscover.first;
          // _initMusic(state.detailDiscoverRespon);
          return Column(
            children: [
              const CustomTitle(text: "Discover Song"),
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.lagu.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTileWidgetMusic(
                      listLagunya: data.lagu,
                      song: data.lagu[index],
                      index: index);
                },
              ),
            ],
          );
          // PlayMusicWidget(
          //     dataEnum: JenisMusic.discovery.text,
          //     data: state.detailDiscoverRespon,

          //     // data: _initMusic(state.detailDiscoverRespon),
          //     dataCover: data.cover,
          //     dataArtist: data.artis,
          //     dataJudul: data.lagu.first.judul,
          //     screenHeight: screenHeight,
          //     screenWidth: screenWidth,
          //     // positionDataStream: _positionDataStream,
          //     audioPlayer: audioPlayerService);
        } else if (state is GetDetailDiscoverFailed) {
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

  Future<void> _initMusic(DetailDiscoverResponModel data) async {
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
    } catch (e) {
      // showToast("Error loading audio source");
      // _showBottomSheet(context);
      print("Error loading audio source: $e");
    }
  }
}




// class PlayMusicWidget<T> extends StatelessWidget {
//   const PlayMusicWidget({
//     super.key,
//     required this.data,
//     required this.screenHeight,
//     required this.screenWidth,
//     required Stream<PositionData> positionDataStream,
//     required AudioPlayer audioPlayer,
//   }) : _positionDataStream = positionDataStream, _audioPlayer = audioPlayer;

//   final T data;
//   final double screenHeight;
//   final double screenWidth;
//   final Stream<PositionData> _positionDataStream;
//   final AudioPlayer _audioPlayer;

//   @override
//   Widget build(BuildContext context) {
    
//     return ListView(
//       children: [
//         spaceHeight02,
//         Stack(
//           children: [
//             Padding(
//               padding: sizePadding * 2 + sizePaddingvertical01,
//               child: Container(
//                 decoration: BoxDecoration(boxShadow: [
//                   BoxShadow(
//                       color: AppColor.kPrimaryColor.withOpacity(0.2),
//                       blurRadius: 15,
//                       spreadRadius: 5,
//                       offset: const Offset(0, 0))
//                 ], borderRadius: BorderRadius.circular(20)),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: CachedNetworkImage(
//                     imageUrl: "${EndPoints.baseURL}/${data.cover}",
//                     // height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) => ShimmerHome(
//                       screenHeight: screenHeight,
//                       screenWidth: screenWidth,
//                     ),
//                     errorWidget: (context, url, error) =>
//                         const Icon(Icons.error),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//         Padding(
//           padding: sizePadding,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               spaceHeight04,
//               spaceHeight02,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Text(data.artis,
//                         textAlign: TextAlign.center,
//                         style: AppStyle.blackMosTextBoldStyle
//                             .copyWith(color: AppColor.kPrimaryColor)),
//                   ),
//                 ],
//               ),
//               spaceHeight02,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Text(data.lagu.first.judul,
//                         textAlign: TextAlign.center,
//                         style: AppStyle.blackMosTextMediumStyle
//                             .copyWith(color: AppColor.kPrimaryColor)),
//                   ),
//                 ],
//               ),
//               Card(
//                 child: Padding(
//                   padding: sizePaddingvertical01 * 2 + sizePadding,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       spaceHeight02,
//                       StreamBuilder<PositionData>(
//                           stream: _positionDataStream,
//                           builder: (context, snapshot) {
//                             final positionData = snapshot.data;
//                             return Row(
//                               children: [
//                                 Expanded(
//                                   flex: 10,
//                                   child: ProgressBar(
//                                       bufferedBarColor: AppColor
//                                           .kPrimaryColor
//                                           .withOpacity(0.6),
//                                       barCapShape: BarCapShape.round,
//                                       thumbRadius: 10,
//                                       thumbGlowColor: Colors.transparent,
//                                       thumbCanPaintOutsideBar: false,
//                                       barHeight: 7,
//                                       thumbColor: AppColor.kPrimaryColor,
//                                       baseBarColor: AppColor.kPrimaryColor
//                                           .withOpacity(0.1),
//                                       progressBarColor:
//                                           AppColor.kPrimaryColor,
//                                       timeLabelPadding: 8,
//                                       timeLabelLocation:
//                                           TimeLabelLocation.above,
//                                       timeLabelTextStyle:
//                                           AppStyle.primaryTextMediumStyle,
//                                       progress: positionData?.position ??
//                                           Duration.zero,
//                                       buffered: positionData
//                                               ?.bufferedPosition ??
//                                           Duration.zero,
//                                       onSeek: _audioPlayer.seek,
//                                       total: positionData?.duration ??
//                                           Duration.zero),
//                                 ),
//                               ],
//                             );
//                           }),
//                       spaceHeight02,
//                       Controls(audioPlayer: _audioPlayer)
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
