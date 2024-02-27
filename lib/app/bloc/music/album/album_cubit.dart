import 'dart:io';

import 'package:beemusic/app/api/repo/music/music_repository.dart';
import 'package:beemusic/app/bloc/music/album/album_state.dart';
import 'package:beemusic/app/model/api_response_model.dart';
import 'package:beemusic/app/model/response/album/album_respon.dart';
import 'package:beemusic/app/utils/constant/enum.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final MusicRepository _musicRepository;

  AlbumCubit({
    required MusicRepository musicRepository,
  })  : _musicRepository = musicRepository,
        super(AlbumInitial());

  void albumGet() async {
    emit(AlbumLoading());
    final ApiResponse response = await _musicRepository.albumGet();
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
      var albumRespon = AlbumResponModel.fromJson(responseBody);
      emit(GetAlbumSuccess(albumRespon: albumRespon));
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
        emit(GetAlbumFailed(errorMessage: Status.noconnection.text));
      } catch (e) {
        print("Error decoding JSON: $e");
      }
    } else {
      emit(GetAlbumFailed(errorMessage: errorMessage));
    }
  }
}
