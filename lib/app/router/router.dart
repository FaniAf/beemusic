import 'package:beemusic/app/bloc/music/artist/detail/detail_artist_cubit.dart';
import 'package:beemusic/app/model/response/album/detail_album_respon.dart';
import 'package:beemusic/app/model/response/tophits/detail_tophits_respon.dart';
import 'package:beemusic/app/views/main_menu/home/home_screen.dart';
import 'package:beemusic/app/views/main_menu/home/tab/album/detail/detail_album.dart';
import 'package:beemusic/app/views/main_menu/home/tab/artist/detail/detail_artist.dart';
import 'package:beemusic/app/views/main_menu/home/tab/home/detail/discover/detail_discover.dart';
import 'package:beemusic/app/views/main_menu/home/tab/home/detail/tophits/detail_tophits.dart';
import 'package:beemusic/app/views/main_menu/home/tab/song/detail/detail_song.dart';
import 'package:beemusic/app/widgets/music_detail.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:beemusic/app/views/auth/auth_screen.dart';
import 'package:beemusic/app/views/main_menu/main_screen.dart';
import 'package:beemusic/app/views/splash_screen.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //startMenu
      case SplashScreen.id:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case AuthScreen.id:
        return PageTransition(
          child: const AuthScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case MainScreen.id:
        return PageTransition(
          child: const MainScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case HomeScreen.id:
        return PageTransition(
          child: const HomeScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case DetailMusicScreen.id:
        return PageTransition(
          child: const DetailMusicScreen(),
          type: PageTransitionType.rightToLeft,
        );
      case DetailAlbumScreen.id:
        final String idMusic = settings.arguments as String;
        return PageTransition(
          child: DetailAlbumScreen(idMusic: idMusic),
          type: PageTransitionType.rightToLeft,
        );
      case DetailDiscoverScreen.id:
        final String idMusic = settings.arguments as String;
        return PageTransition(
          child: DetailDiscoverScreen(idMusic: idMusic),
          type: PageTransitionType.rightToLeft,
        );
      case DetailTopHitsScreen.id:
        final String idMusic = settings.arguments as String;
        return PageTransition(
          child: DetailTopHitsScreen(idMusic: idMusic),
          type: PageTransitionType.rightToLeft,
        );
      case DetailArtistScreen.id:
        final String idMusic = settings.arguments as String;
        return PageTransition(
          child: DetailArtistScreen(idMusic: idMusic),
          type: PageTransitionType.rightToLeft,
        );
      case DetailSongScreen.id:
        final String idMusic = settings.arguments as String;
        return PageTransition(
          child: DetailSongScreen(idMusic: idMusic),
          type: PageTransitionType.rightToLeft,
        );

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
