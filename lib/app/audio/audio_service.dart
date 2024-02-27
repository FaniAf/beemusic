import 'package:beemusic/app/api/endpoint/endpoint.dart';
import 'package:beemusic/app/audio/audio_handler.dart';
import 'package:beemusic/app/bloc/music/song/detail/detail_song_state.dart';
import 'package:beemusic/app/bloc/music/song/song_state.dart';
import 'package:beemusic/app/bloc/music/tophits/tophits_state.dart';
import 'package:beemusic/app/model/response/album/detail_album_respon.dart';
import 'package:beemusic/app/model/response/artist/detail_artist_respon.dart';
import 'package:beemusic/app/model/response/song/song_respon.dart';
import 'package:beemusic/app/model/response/tophits/tophits_respon.dart';
import 'package:beemusic/app/utils/constant/app_image.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:audio_session/audio_session.dart';

final audioPlayerService = AudioPlayer();

Future<void> initMusicSong<T>(T datas, int index, List<T> listLagu) async {
  if (datas is GetSongSuccess) {
    final GetSongSuccess data = datas;

    try {
      // Inform the operating system of our app's audio attributes, etc.
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.speech());

      // Listen to errors during playback.
      audioPlayerService.playbackEventStream.listen((event) {},
          onError: (Object e, StackTrace stackTrace) {
        print('A stream error occurred: $e');
      });

      if (data.songRespon.song.isNotEmpty &&
          data.songRespon.song[index].url.isNotEmpty) {
        String url = "${EndPoints.baseURL}${data.songRespon.song[index].url}";

        final List<AudioSource> playlistChildren = [
          AudioSource.uri(
            Uri.parse(url),
            tag: MediaItem(
              id: '1',
              title: data.songRespon.song[index].judul,
              album: data.songRespon.song[index].judul,
              artist: data.songRespon.song[index].artis,
              artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
            ),
          ),
        ];
        for (var track in listLagu as List<Song>) {
          // Replace 'otherTracks' with your actual list
          playlistChildren.add(
            AudioSource.uri(
              Uri.parse("${EndPoints.baseURL}${track.url}"),
              tag: MediaItem(
                id: track.id.toString(), // Assuming each track has a unique ID
                title: track.judul,
                album: track
                    .judul, // Adjust these properties based on your data structure
                artist: track.artis,
                artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
              ),
            ),
          );
        }
        final playlist = ConcatenatingAudioSource(children: playlistChildren);
        await audioPlayerService.setAudioSource(playlist);
        audioPlayerService.play();
        getCurrentTrackTitle();
        getCurrentTrackArtist();

        getCurrentTrackImageUri();
        print("Play di GetSongSuccess");
      } else {
        print("No valid audio data found in the GetSongSuccess.");
      }
    } catch (e) {
      // Handle audio initialization error.
      print("Error initializing audio: $e");
    }
  }
  //  else {
  //   print("Invalid data type. Expected GetSongSuccess.");
  // }
  else if (datas is GetTopHitsSuccess) {
    final GetTopHitsSuccess data = datas;

    try {
      // Inform the operating system of our app's audio attributes, etc.
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.speech());

      // Listen to errors during playback.
      audioPlayerService.playbackEventStream.listen((event) {},
          onError: (Object e, StackTrace stackTrace) {
        print('A stream error occurred: $e');
      });

      if (data.topHitsRespon.topHits.isNotEmpty &&
          data.topHitsRespon.topHits[index].url.isNotEmpty) {
        String url =
            "${EndPoints.baseURL}${data.topHitsRespon.topHits[index].url}";
        // print(url);
        final List<AudioSource> playlistChildren = [
          AudioSource.uri(
            Uri.parse(url),
            tag: MediaItem(
              id: '1',
              title: data.topHitsRespon.topHits[index].lagu,
              album: data.topHitsRespon.topHits[index].judul,
              artist: data.topHitsRespon.topHits[index].artis,
              artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
            ),
          ),
        ];
        for (var track in listLagu as List<TopHits>) {
          // Replace 'otherTracks' with your actual list
          playlistChildren.add(
            AudioSource.uri(
              Uri.parse("${EndPoints.baseURL}${track.url}"),
              tag: MediaItem(
                id: track.id.toString(), // Assuming each track has a unique ID
                title: track.lagu,
                album: track
                    .judul, // Adjust these properties based on your data structure
                artist: track.artis,
                artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
              ),
            ),
          );
        }
        final playlist = ConcatenatingAudioSource(children: playlistChildren);
        await audioPlayerService.setAudioSource(playlist);
        audioPlayerService.play();
        getCurrentTrackTitle();
        getCurrentTrackArtist();

        getCurrentTrackImageUri();
        print("Play");
        print("Play");
        print("Play");
      } else {
        print("No valid audio data found in the GetTopHitsSuccess.");
      }
    } catch (e) {
      // Handle audio initialization error.
      print("Error initializing audio: $e");
    }
  }
  //  else {
  //   print("Invalid data type. Expected GetTopHitsSuccess.");
  // }
  else if (datas is Lagu) {
    final Lagu data = datas;

    try {
      // Inform the operating system of our app's audio attributes, etc.
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.speech());

      // Listen to errors during playback.
      audioPlayerService.playbackEventStream.listen((event) {},
          onError: (Object e, StackTrace stackTrace) {
        print('A stream error occurred: $e');
      });

      if (data.judul.isNotEmpty && data.url.isNotEmpty) {
        String url = "${EndPoints.baseURL}${data.url}";
        print(url);
        final List<AudioSource> playlistChildren = [
          AudioSource.uri(
            Uri.parse(url),
            tag: MediaItem(
              id: '1',
              title: data.judul,
              album: data.judul,
              artist: data.judul,
              artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
            ),
          ),
        ];
        for (var track in listLagu as List<Lagu>) {
          // Replace 'otherTracks' with your actual list
          playlistChildren.add(
            AudioSource.uri(
              Uri.parse("${EndPoints.baseURL}${track.url}"),
              tag: MediaItem(
                id: track.id.toString(), // Assuming each track has a unique ID
                title: track.judul,
                album: track
                    .judul, // Adjust these properties based on your data structure
                artist: track.judul,
                artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
              ),
            ),
          );
        }
        final playlist = ConcatenatingAudioSource(children: playlistChildren);
        await audioPlayerService.setAudioSource(playlist);
        audioPlayerService.play();
        getCurrentTrackTitle();
        getCurrentTrackArtist();
        getCurrentTrackImageUri();
        print("Play");
        print("Play");
      } else {
        print("No valid audio data found in the GetTopHitsSuccess.");
      }
    } catch (e) {
      // Handle audio initialization error.
      print("Error initializing audio: $e");
    }
  }
  //  else {
  //   print("Invalid data type. Expected Lagu.");
  // }
  else if (datas is DetailAlbumRespon) {
    final DetailAlbumRespon data = datas;

    try {
      // Inform the operating system of our app's audio attributes, etc.
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.speech());

      // Listen to errors during playback.
      audioPlayerService.playbackEventStream.listen((event) {},
          onError: (Object e, StackTrace stackTrace) {
        print('A stream error occurred: $e');
      });

      if (data.judul.isNotEmpty && data.lagu.isNotEmpty) {
        String url = "${EndPoints.baseURL}${data.lagu[index].url}";
        print(url);
        // final playlist = ConcatenatingAudioSource(children: [
        //   AudioSource.uri(
        //     Uri.parse(url),
        //     tag: MediaItem(
        //       id: '1',
        //       title: data.lagu[index].judul,
        //       album: data.judul,
        //       artist: data.artis,
        //       artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
        //     ),
        //   ),
        // ]);
        final List<AudioSource> playlistChildren = [
          AudioSource.uri(
            Uri.parse(url),
            tag: MediaItem(
              id: '1',
              title: data.lagu[index].judul,
              album: data.judul,
              artist: data.artis,
              artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
            ),
          ),
        ];
        for (var track in listLagu as List<Lagu>) {
          // Replace 'otherTracks' with your actual list
          playlistChildren.add(
            AudioSource.uri(
              Uri.parse("${EndPoints.baseURL}${track.url}"),
              tag: MediaItem(
                id: track.id.toString(), // Assuming each track has a unique ID
                title: track.judul,
                album: track
                    .judul, // Adjust these properties based on your data structure
                artist: data.artis,
                artUri: Uri.parse(AppImage.kImageDefaultPosterNetwork),
              ),
            ),
          );
        }
        final playlist = ConcatenatingAudioSource(children: playlistChildren);
        await audioPlayerService.setAudioSource(playlist);

        audioPlayerService.play();
        getCurrentTrackTitle();
        getCurrentTrackArtist();

        getCurrentTrackImageUri();
        print("Play");
      } else {
        print("No valid audio data found in the Albums.");
      }
    } catch (e) {
      // Handle audio initialization error.
      print("Error initializing audio: $e");
    }
  } else {
    print("Invalid data type. Expected Albums.");
  }
}
