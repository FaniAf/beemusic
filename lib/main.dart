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
import 'package:beemusic/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:beemusic/app/bloc/auth/auth_cubit.dart';
import 'package:beemusic/app/bloc/bloc_observer.dart';
import 'package:beemusic/app/bloc/bottom_navigator/tab_cubit.dart';
import 'package:beemusic/app/router/injection.dart';
import 'package:beemusic/app/router/router.dart';
import 'package:beemusic/app/utils/constant/app_color.dart';
import 'package:beemusic/app/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  //locator
  setup();
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.black54,
  //     statusBarColor: Color.fromARGB(255, 1, 66, 177), // status bar color
  //   ),
  // );

  //hydrated bloc & bloc observer setup
  getTemporaryDirectory().then((path) async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: path,
    );
  });
  Bloc.observer = MyBlocObserver();
  // BlocOverrides.runZoned(

  //   () {
  configLoading();
  print("object");
  runApp(const MyApp());
  print("object2");
}

void configLoading() {
  EasyLoading.instance
    ..backgroundColor = AppColor.kPrimaryColor
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..userInteractions = false
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColor.kPrimaryColor
    ..indicatorColor = AppColor.kWhiteColor
    ..textColor = AppColor.kWhiteColor
    ..progressColor = AppColor.kWhiteColor
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = AppColor.kWhiteColor.withOpacity(0.5);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => GestureDetector(
              onTap: () => primaryFocus?.unfocus(),
              child: MultiBlocProvider(
                  providers: [
                    BlocProvider<AuthCubit>(
                      create: (_) => getIt.get<AuthCubit>(),
                    ),
                    BlocProvider<BottomNavCubit>(
                      create: (_) => getIt.get<BottomNavCubit>(),
                    ),
                    BlocProvider<AlbumCubit>(
                      create: (_) => getIt.get<AlbumCubit>(),
                    ),
                    BlocProvider<DetailAlbumCubit>(
                      create: (_) => getIt.get<DetailAlbumCubit>(),
                    ),
                    BlocProvider<ArtistCubit>(
                      create: (_) => getIt.get<ArtistCubit>(),
                    ),
                    BlocProvider<DetailArtistCubit>(
                      create: (_) => getIt.get<DetailArtistCubit>(),
                    ),
                    BlocProvider<DiscoverCubit>(
                      create: (_) => getIt.get<DiscoverCubit>(),
                    ),
                    BlocProvider<DetailDiscoverCubit>(
                      create: (_) => getIt.get<DetailDiscoverCubit>(),
                    ),
                    BlocProvider<GenreCubit>(
                      create: (_) => getIt.get<GenreCubit>(),
                    ),
                    BlocProvider<DetailGenreCubit>(
                      create: (_) => getIt.get<DetailGenreCubit>(),
                    ),
                    BlocProvider<SongCubit>(
                      create: (_) => getIt.get<SongCubit>(),
                    ),
                    BlocProvider<DetailSongCubit>(
                      create: (_) => getIt.get<DetailSongCubit>(),
                    ),
                    BlocProvider<TopHitsCubit>(
                      create: (_) => getIt.get<TopHitsCubit>(),
                    ),
                    BlocProvider<DetailTopHitsCubit>(
                      create: (_) => getIt.get<DetailTopHitsCubit>(),
                    ),
                    BlocProvider<AuthBloc>(
                      create: (_) => getIt.get<AuthBloc>(),
                    ),
                  ],
                  child: MaterialApp(
                    title: 'scollar',
                    theme: ThemeData(
                        primaryColor: AppColor.kPrimaryColor,
                        colorScheme: ColorScheme.fromSeed(
                          seedColor: const Color(0xff121212),
                          // AppColor.kPrimaryColor,
                          brightness: Brightness.dark,
                        ),
                        useMaterial3: true),
                    debugShowCheckedModeBanner: false,
                    onGenerateRoute: RouterGenerator.generateRoute,
                    initialRoute: SplashScreen.id,
                    builder: EasyLoading.init(),
                  )),
            ));
  }
}
