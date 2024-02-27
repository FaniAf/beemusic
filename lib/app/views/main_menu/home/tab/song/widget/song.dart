import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/bloc/music/discover/discover_cubit.dart';
import 'package:beemusic/app/bloc/music/discover/discover_state.dart';
import 'package:beemusic/app/bloc/music/song/song_cubit.dart';
import 'package:beemusic/app/bloc/music/song/song_state.dart';
import 'package:beemusic/app/config/app_config.dart';
import 'package:beemusic/app/extension/navigation.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/component/shimmer.dart';
import 'package:beemusic/app/utils/constant/app_image.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/views/main_menu/home/tab/home/detail/discover/detail_discover.dart';
import 'package:beemusic/app/views/main_menu/home/tab/song/detail/detail_song.dart';
import 'package:beemusic/app/widgets/cover_card.dart';
import 'package:beemusic/app/widgets/custom_title.dart';
import 'package:beemusic/app/widgets/shimmer_home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:redacted/redacted.dart';
import 'package:shimmer/shimmer.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final SongCubit _songCubit = getIt<SongCubit>();
  List<bool> isLoadingList = [];
  @override
  void initState() {
    _songCubit.songGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<SongCubit, SongState>(
      builder: (context, state) {
        if (state is GetSongSuccess) {
          final data = state.songRespon.song;
          return Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.05,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'Songs'),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  left: screenWidth * 0.040, right: screenWidth * 0.040),
              // scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final song = data[index];
                bool isLoading =
                    isLoadingList.length > index && isLoadingList[index];

                return ListTile(
                  onTap: () async {
                    setState(() {
                      if (isLoadingList.length <= index) {
                        isLoadingList.add(true);
                      } else {
                        isLoadingList[index] = true;
                      }
                    });
                    initMusicSong(state, index, data);
                    await Future.delayed(const Duration(seconds: 2));
                    print("index");
                    print(index);
                    setState(() {
                      isLoadingList[index] = false;
                    });
                  },
                  title: Text(song.judul),
                  subtitle: Text(song.artis),
                  leading: CachedNetworkImage(
                    imageUrl: AppImage
                        .kImageDefaultPosterNetwork, // Replace 'imageUrl' with your actual image URL
                    width: 50, // Set your desired width
                    height: 50, // Set your desired height
                    imageBuilder: (context, imageProvider) => Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  imageProvider, // Use the imageProvider from CachedNetworkImage
                            ),
                          ),
                        ),
                        if (isLoading) // Tampilkan CircularProgressIndicator jika isLoading true
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                      ],
                    ),
                    placeholder: (context, url) => ShimmerLoading(
                        child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                    )), // You can customize the placeholder
                    errorWidget: (context, url, error) => const Icon(
                        Icons.error), // You can customize the error widget
                  ),
                );
              },
            ),
          ]);
        } else if (state is GetSongFailed) {
          return Text(state.errorMessage);
        } else {
          return ShimmerHome(
              screenWidth: screenWidth, screenHeight: screenHeight);
        }
      },
    );
  }
}
