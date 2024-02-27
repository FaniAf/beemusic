import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/bloc/music/tophits/tophits_cubit.dart';
import 'package:beemusic/app/bloc/music/tophits/tophits_state.dart';
import 'package:beemusic/app/extension/navigation.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/constant/app_image.dart';
import 'package:beemusic/app/views/main_menu/home/tab/home/detail/tophits/detail_tophits.dart';
import 'package:beemusic/app/widgets/cover_card.dart';
import 'package:beemusic/app/widgets/custom_title.dart';
import 'package:beemusic/app/widgets/shimmer_home.dart';
import 'package:beemusic/app/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class TopHitsScreen extends StatefulWidget {
  const TopHitsScreen({super.key});

  @override
  State<TopHitsScreen> createState() => _TopHitsScreenState();
}

class _TopHitsScreenState extends State<TopHitsScreen> {
  final TopHitsCubit _topHitsCubit = getIt<TopHitsCubit>();

  @override
  void initState() {
    _topHitsCubit.topHitsGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<TopHitsCubit, TopHitsState>(
      builder: (context, state) {
        if (state is GetTopHitsSuccess) {
          final data = state.topHitsRespon.topHits;
          return Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.01,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'Top Hits'),
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
                  final topHits = data[index];
                  bool isLoading =
                      isLoadingList.length > index && isLoadingList[index];

                  return Bounceable(
                      onTap: () async {
                        setState(() {
                          if (isLoadingList.length <= index) {
                            isLoadingList.add(true);
                          } else {
                            isLoadingList[index] = true;
                          }
                        });
                        // context.pushNamed(DetailTopHitsScreen.id,
                        //     arguments: topHits.id.toString());
                        initMusicSong(state, index, data);
                        await Future.delayed(const Duration(seconds: 2));

                        setState(() {
                          isLoadingList[index] = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  const PosterCard(
                                    imageUrl:
                                        AppImage.kImageDefaultPosterNetwork,
                                  ),
                                  if (isLoading) // Tampilkan CircularProgressIndicator jika isLoading true
                                    const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(topHits.lagu),
                              )
                            ],
                          ),
                        ],
                      ));
                },
              ),
            ),
          ]);
        } else if (state is GetTopHitsFailed) {
          return Text(state.errorMessage);
        } else {
          return ShimmerHome(
              screenWidth: screenWidth, screenHeight: screenHeight);
        }
      },
    );
  }
}
