import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/bloc/music/discover/discover_cubit.dart';
import 'package:beemusic/app/bloc/music/discover/discover_state.dart';
import 'package:beemusic/app/extension/navigation.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/component/shimmer.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/views/main_menu/home/tab/home/detail/discover/detail_discover.dart';
import 'package:beemusic/app/widgets/cover_card.dart';
import 'package:beemusic/app/widgets/custom_title.dart';
import 'package:beemusic/app/widgets/shimmer_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:redacted/redacted.dart';
import 'package:shimmer/shimmer.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final DiscoverCubit _discoverCubit = getIt<DiscoverCubit>();

  @override
  void initState() {
    _discoverCubit.discoverGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      builder: (context, state) {
        if (state is GetDiscoverSuccess) {
          final data = state.discoverRespon.discover;
          return Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  top: screenHeight * 0.01,
                  bottom: screenHeight * 0.02),
              child: const CustomTitle(text: 'Discover'),
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
                  final discover = data[index];
                  return Bounceable(
                      onTap: () {
                        context.pushNamed(DetailDiscoverScreen.id,
                            arguments: discover.id.toString());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PosterCard(
                            imageUrl: "${EndPoints.baseURL}/${discover.cover}",
                          ),
                        ],
                      ));
                },
              ),
            ),
          ]);
        } else if (state is GetDiscoverFailed) {
          return Text(state.errorMessage);
        } else {
          return ShimmerHome(
              screenWidth: screenWidth, screenHeight: screenHeight);
        }
      },
    );
  }
}
