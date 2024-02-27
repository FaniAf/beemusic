import 'package:beemusic/app/bloc/music/artist/artist_cubit.dart';
import 'package:beemusic/app/bloc/music/artist/artist_state.dart';
import 'package:beemusic/app/extension/navigation.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/constant/app_image.dart';
import 'package:beemusic/app/views/main_menu/home/tab/artist/detail/detail_artist.dart';
import 'package:beemusic/app/widgets/cover_card.dart';
import 'package:beemusic/app/widgets/custom_title.dart';
import 'package:beemusic/app/widgets/shimmer_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key});

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  final ArtistCubit _artistCubit = getIt<ArtistCubit>();

  @override
  void initState() {
    _artistCubit.artistGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<ArtistCubit, ArtistState>(
      builder: (context, state) {
        if (state is GetArtistSuccess) {
          final data = state.artistRespon.artist;
          return Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.05,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'Artist'),
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
                  final artist = data[index];
                  return Bounceable(
                      onTap: () {
                        context.pushNamed(DetailArtistScreen.id,
                            arguments: artist.id.toString());
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
        } else if (state is GetArtistFailed) {
          return Text(state.errorMessage);
        } else {
          return ShimmerHome(
              screenWidth: screenWidth, screenHeight: screenHeight);
        }
      },
    );
  }
}
