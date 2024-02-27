import 'dart:convert';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:beemusic/app/audio/audio_handler.dart';
import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/common/audio_control.dart';
import 'package:beemusic/app/common/music_manager.dart';
import 'package:beemusic/app/model/music_model.dart';
import 'package:beemusic/app/views/main_menu/home/tab/album/widget/album_screen.dart';
import 'package:beemusic/app/views/main_menu/home/tab/artist/widget/artist_screen.dart';
import 'package:beemusic/app/views/main_menu/home/tab/song/widget/song.dart';
import 'package:beemusic/app/widgets/mini_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beemusic/app/bloc/bottom_navigator/tab_cubit.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:beemusic/app/views/auth/auth_screen.dart';
import 'package:beemusic/app/views/main_menu/home/home_screen.dart';
import 'package:beemusic/app/views/main_menu/profil/profil_screen.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const id = "/main_screen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BottomNavCubit _bottomNavCubit = getIt<BottomNavCubit>();
  final List<IconData> _iconList = [
    AppIcon.kIconHome,
    AppIcon.kIconsSongs,
    AppIcon.kIconAlbums,
    AppIcon.kIconArtis,
    AppIcon.kIconProfil,
  ];

  void _changeSelectedNavBar(int index) {
    _bottomNavCubit.changePage(index);
  }

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    print(isAudioPlaying);
    print(audioPlayerService.audioSource);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Container(
              height: 50,
              // padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text("Tab lagi untuk keluar",
                    style: AppStyle.whiteTextBoldStyle10),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          child: BlocBuilder<BottomNavCubit, int>(builder: (context, state) {
            if (state == 0) {
              return const HomeScreen();
            } else if (state == 1) {
              return const SongScreen();
            } else if (state == 2) {
              return const AlbumScreen();
            } else if (state == 3) {
              return const ArtistScreen();
            } else if (state == 4) {
              return const ProfilScreen();
            }
            return const AuthScreen();
          }),
        ), //destination screen
        // floatingActionButton: widgetFloatingButton(isDarkTheme),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
          ValueListenableBuilder<bool>(
            valueListenable: isAudioPlayingNotifier,
            builder: (context, isPlaying, child) {
              // initAudioPlayer();
              // Bangun UI yang perlu diperbarui berdasarkan isPlaying
              return isPlaying ? const MiniPlayer() : const SizedBox();
            },
          ),
          // isAudioPlaying! ? const MiniPlayer() : const SizedBox(),
          widgetBottomNavigator(),
        ]));
  }

  BlocBuilder<BottomNavCubit, int> widgetBottomNavigator() {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) => Container(
        decoration: BoxDecoration(
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   topRight: Radius.circular(20),
          // ),
          color: AppColor.kWhiteColor,
        ),
        child: AnimatedBottomNavigationBar.builder(
          tabBuilder: (int index, bool isActive) {
            final color =
                isActive ? AppColor.kPrimaryColor : AppColor.kGreyColor;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(_iconList[index], size: 24, color: color),
                isActive
                    ? const SizedBox(height: 4)
                    : const SizedBox(
                        height: 2,
                      ),
                isActive
                    ? Container(
                        height: 3,
                        width: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColor.kPrimaryColor),
                      )
                    : const SizedBox(),
                isActive ? const SizedBox(height: 4) : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    index == 0
                        ? "Home"
                        : index == 1
                            ? "Songs"
                            : index == 2
                                ? "Albums"
                                : index == 3
                                    ? "Artist"
                                    : index == 4
                                        ? "Profile"
                                        : "",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: isActive
                        ? AppStyle.primaryTextMediumStyle10
                            .copyWith(letterSpacing: 0)
                        : AppStyle.greyTextMediumStyle10.copyWith(
                            letterSpacing: 0,
                          ),
                  ),
                ),
                spaceHeight02
              ],
            );
          },
          elevation: 0,
          activeIndex: state,
          itemCount: _iconList.length,
          onTap: _changeSelectedNavBar,
          gapLocation: GapLocation.none,
          // gapWidth: 0,
          notchSmoothness: NotchSmoothness.defaultEdge,
          notchMargin: -20,
          // notchAndCornersAnimation: borderRadiusAnimation,
          // blurEffect: true,
          height: 70,
          shadow: const BoxShadow(
            color: Colors.black,
            offset: Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0.5,
          ),
          // leftCornerRadius: 20,
          // rightCornerRadius: 20,
          backgroundColor:
              //  Colors.white
              getBackgroundColorMain(context),
          // backgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
