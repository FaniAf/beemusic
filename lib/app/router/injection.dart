import 'package:beemusic/app/api/repo/music/music_repository.dart';
import 'package:beemusic/app/bloc/auth/auth_google.dart';
import 'package:beemusic/app/bloc/music/album/album_cubit.dart';
import 'package:beemusic/app/bloc/music/album/detail/detail_album_cubit.dart';
import 'package:beemusic/app/bloc/music/artist/artist_cubit.dart';
import 'package:beemusic/app/bloc/music/artist/detail/detail_artist_cubit.dart';
import 'package:beemusic/app/bloc/music/discover/detail/detail_discover_cubit.dart';
import 'package:beemusic/app/bloc/music/discover/discover_cubit.dart';
import 'package:beemusic/app/bloc/music/genre/detail/detail_genre_cubit.dart';
import 'package:beemusic/app/bloc/music/genre/genre_cubit.dart';
import 'package:beemusic/app/bloc/music/song/detail/detail_song_cubit.dart';
import 'package:beemusic/app/bloc/music/song/song_cubit.dart';
import 'package:beemusic/app/bloc/music/tophits/detail/detail_tophits_cubit.dart';
import 'package:beemusic/app/bloc/music/tophits/tophits_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:beemusic/app/api/repo/auth/auth_repository.dart';
import 'package:beemusic/app/bloc/auth/auth_cubit.dart';
import 'package:beemusic/app/bloc/bottom_navigator/tab_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(
    () => AuthCubit(authRepository: AuthRepository()),
  );
  getIt.registerLazySingleton(
    () => AuthBloc(),
  );
  getIt.registerLazySingleton(
    () => BottomNavCubit(),
  );
  getIt.registerLazySingleton(
    () => SongCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => DetailSongCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => TopHitsCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => DetailTopHitsCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => AlbumCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => DetailAlbumCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => ArtistCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => DetailArtistCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => DiscoverCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => DetailDiscoverCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => GenreCubit(musicRepository: MusicRepository()),
  );
  getIt.registerLazySingleton(
    () => DetailGenreCubit(musicRepository: MusicRepository()),
  );
}
