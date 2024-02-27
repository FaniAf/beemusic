import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/common/audio_control.dart';
import 'package:beemusic/app/common/audio_state.dart';
import 'package:beemusic/app/common/music_manager.dart';
import 'package:beemusic/app/model/response/discover/detail_discover_respon.dart';
import 'package:beemusic/app/utils/constant/enum.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/widgets/shimmer_home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';

class PlayMusicWidget<T> extends StatefulWidget {
  const PlayMusicWidget(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      // required Stream<PositionData> positionDataStream,
      required AudioPlayer audioPlayer,
      required this.dataCover,
      required this.dataArtist,
      required this.dataJudul,
      this.usePosterDefault = false,
      this.data,
      this.dataEnum})
      :
        //  _positionDataStream = positionDataStream,
        _audioPlayer = audioPlayer;
  final bool usePosterDefault;
  final T dataCover;
  final T dataArtist;
  final T dataJudul;
  final T? data;
  final String? dataEnum;
  final double screenHeight;
  final double screenWidth;
  // final Stream<PositionData> _positionDataStream;
  final AudioPlayer _audioPlayer;

  @override
  State<PlayMusicWidget<T>> createState() => _PlayMusicWidgetState<T>();
}

class _PlayMusicWidgetState<T> extends State<PlayMusicWidget<T>> {
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          widget._audioPlayer.positionStream,
          widget._audioPlayer.bufferedPositionStream,
          widget._audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Listen to changes in the audio player's state (playing or not) and the current media's ID.
    audioPlayerService.playingStream.listen((isPlaying) {
      // Update the app's state with the current media playing status.
      AppState().setMediaPlaying(isPlaying);
    });

    // Listen to changes in the current media's ID.
    audioPlayerService.currentIndexStream.listen((mediaID) {
      // Update the app's state with the current media's ID.
      AppState().setCurrentlyPlayingMediaID(mediaID!);
    });
    audioPlayerService.playingStream.listen((playerState) {
      print("playerState $playerState");
      if (playerState) {
        setState(() {
          isAudioPlaying = true;
        });
      } else {
        setState(() {
          isAudioPlaying = false;
        });
      }
    });
  }

  bool? isAudioPlaying;

  String getMediaPlay() {
    if (isAudioPlaying! && audioPlayerService.audioSource != null) {
      final audioSource = audioPlayerService.audioSource!;
      if (audioSource is ConcatenatingAudioSource) {
        final currentIndex = audioPlayerService.currentIndex;
        if (currentIndex != null) {
          final MediaItem mediaItem = audioSource.sequence[currentIndex].tag;
          print("mediaItem.playable ${mediaItem.playable}");
          print(mediaItem);
          return mediaItem.title;
        }
      } else if (audioSource is UriAudioSource) {
        return audioSource.tag ?? "Unknown Track";
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    // getMediaPlay();
    if (MusicInitializationManager().isInitialized == false) {
      setState(() {});
      print("object");
      MusicInitializationManager().markInitialized();
    }
    print("print ${MusicInitializationManager().isInitialized}");
    print(getMediaPlay());
    return ListView(
      children: [
        spaceHeight02,
        Stack(
          children: [
            Padding(
              padding: sizePadding * 2 + sizePaddingvertical01,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: AppColor.kPrimaryColor.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: const Offset(0, 0))
                ], borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: widget.usePosterDefault
                        ? AppImage.kImageDefaultPosterNetwork
                        : "${EndPoints.baseURL}/${widget.dataCover}",
                    // height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => ShimmerHome(
                      screenHeight: widget.screenHeight,
                      screenWidth: widget.screenWidth,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: sizePadding,
          child: Column(
            children: [
              spaceHeight02,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(widget.dataArtist.toString(),
                        style: AppStyle.blackMosTextBoldStyle20
                            .copyWith(color: AppColor.kPrimaryColor)),
                  ),
                ],
              ),
              spaceHeight02,
              Row(
                children: [
                  Expanded(
                    child: Text(widget.dataJudul.toString(),
                        style: AppStyle.blackMosTextMediumStyle12
                            .copyWith(color: AppColor.kPrimaryColor)),
                  ),
                ],
              ),
              spaceHeight02,
              Card(
                child: Padding(
                  padding: sizePaddingvertical01 * 2 + sizePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      spaceHeight02,
                      getMediaPlay() == widget.dataJudul
                          ? StreamBuilder<PositionData>(
                              stream: _positionDataStream,
                              builder: (context, snapshot) {
                                final positionData = snapshot.data;
                                return Row(
                                  children: [
                                    Expanded(
                                      flex: 10,
                                      child: ProgressBar(
                                          bufferedBarColor: AppColor
                                              .kPrimaryColor
                                              .withOpacity(0.6),
                                          barCapShape: BarCapShape.round,
                                          thumbRadius: 7,
                                          thumbGlowColor: Colors.transparent,
                                          thumbCanPaintOutsideBar: false,
                                          barHeight: 7,
                                          thumbColor: AppColor.kPrimaryColor,
                                          baseBarColor: AppColor.kPrimaryColor
                                              .withOpacity(0.1),
                                          progressBarColor:
                                              AppColor.kPrimaryColor,
                                          timeLabelPadding: 8,
                                          timeLabelLocation:
                                              TimeLabelLocation.sides,
                                          timeLabelTextStyle:
                                              AppStyle.primaryTextMediumStyle,
                                          progress: positionData?.position ??
                                              Duration.zero,
                                          buffered:
                                              positionData?.bufferedPosition ??
                                                  Duration.zero,
                                          onSeek: widget._audioPlayer.seek,
                                          total: positionData?.duration ??
                                              Duration.zero),
                                    ),
                                  ],
                                );
                              })
                          : Row(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: ProgressBar(
                                      bufferedBarColor: AppColor.kPrimaryColor
                                          .withOpacity(0.6),
                                      barCapShape: BarCapShape.round,
                                      thumbRadius: 7,
                                      thumbGlowColor: Colors.transparent,
                                      thumbCanPaintOutsideBar: false,
                                      barHeight: 7,
                                      thumbColor: AppColor.kPrimaryColor,
                                      baseBarColor: AppColor.kPrimaryColor
                                          .withOpacity(0.1),
                                      progressBarColor: AppColor.kPrimaryColor,
                                      timeLabelPadding: 8,
                                      timeLabelLocation:
                                          TimeLabelLocation.sides,
                                      timeLabelTextStyle:
                                          AppStyle.primaryTextMediumStyle,
                                      progress: Duration.zero,
                                      buffered: Duration.zero,
                                      onSeek: widget._audioPlayer.seek,
                                      total: Duration.zero),
                                ),
                              ],
                            ),
                      spaceHeight02,
                      Controls(
                          audioPlayer: widget._audioPlayer,
                          data: widget.data,
                          dataEnum: widget.dataEnum,
                          musicInitializationManager:
                              MusicInitializationManager())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
