import 'dart:io';

import 'package:beemusic/app/api/repo/music/music_repository.dart';
import 'package:beemusic/app/bloc/music/song/song_state.dart';
import 'package:beemusic/app/model/api_response_model.dart';
import 'package:beemusic/app/model/response/song/song_respon.dart';
import 'package:beemusic/app/utils/constant/enum.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SongCubit extends Cubit<SongState> {
  final MusicRepository _musicRepository;

  SongCubit({
    required MusicRepository musicRepository,
  })  : _musicRepository = musicRepository,
        super(SongInitial());

  void songGet() async {
    emit(SongLoading());
    final ApiResponse response = await _musicRepository.songGet();
    try {
      print(response.statusCode);
      switch (response.statusCode) {
        case HttpStatus.ok:
          print("Success");
          print(response.body);
          _handleSuccess(response.body);
          break;
        case HttpStatus.networkConnectTimeoutError:
          print(response.body);
          _handleError(
            errorType: ResponseAPI.getFailed,
            responseCode: response.statusCode,
          );
          break;
        default:
          _handleError(errorType: ResponseAPI.getFailed);
      }
    } catch (_) {
      _handleError(errorType: ResponseAPI.failed);
    }
  }

  void _handleSuccess(
    Map<String, dynamic> responseBody,
  ) {
    try {
      var songRespon = SongResponModel.fromJson(responseBody);
      emit(GetSongSuccess(songRespon: songRespon));
    } catch (e) {
      print("Error decoding JSON: $e");
    }
  }

  void _handleError({
    ResponseAPI? errorType,
    int? responseCode,
  }) {
    String errorMessage =
        errorType == ResponseAPI.getFailed ? "Gagal Get" : "Failed";
    if (responseCode == HttpStatus.networkConnectTimeoutError) {
      try {
        emit(GetSongFailed(errorMessage: Status.noconnection.text));
      } catch (e) {
        print("Error decoding JSON: $e");
      }
    } else {
      emit(GetSongFailed(errorMessage: errorMessage));
    }
  }
}
