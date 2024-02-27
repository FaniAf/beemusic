import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/bloc/music/album/album_cubit.dart';
import 'package:beemusic/app/bloc/music/album/album_state.dart';
import 'package:beemusic/app/bloc/music/discover/discover_cubit.dart';
import 'package:beemusic/app/bloc/music/discover/discover_state.dart';
import 'package:beemusic/app/extension/navigation.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/component/shimmer.dart';
import 'package:beemusic/app/utils/constant/app_image.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/views/main_menu/home/tab/album/detail/detail_album.dart';
import 'package:beemusic/app/widgets/cover_card.dart';
import 'package:beemusic/app/widgets/custom_title.dart';
import 'package:beemusic/app/widgets/shimmer_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:redacted/redacted.dart';
import 'package:shimmer/shimmer.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final AlbumCubit _albumCubit = getIt<AlbumCubit>();

  @override
  void initState() {
    _albumCubit.albumGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<AlbumCubit, AlbumState>(
      builder: (context, state) {
        if (state is GetAlbumSuccess) {
          final data = state.albumRespon.album;
          return Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.05,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'Album'),
            ),
            SizedBox(
              height: screenHeight * 0.24,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    left: screenWidth * 0.040, right: screenWidth * 0.040),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final album = data[index];
                  return Bounceable(
                      onTap: () {
                        context.pushNamed(DetailAlbumScreen.id,
                            arguments: album.id.toString());
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PosterCard(
                              imageUrl: AppImage.kImageDefaultPosterNetwork),
                        ],
                      ));
                },
              ),
            ),
          ]);
        } else if (state is GetAlbumFailed) {
          return Text(state.errorMessage);
        } else {
          return ShimmerHome(
              screenWidth: screenWidth, screenHeight: screenHeight);
        }
      },
    );
  }
}
