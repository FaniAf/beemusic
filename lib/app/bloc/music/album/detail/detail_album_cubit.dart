import 'dart:io';

import 'package:beemusic/app/api/repo/music/music_repository.dart';
import 'package:beemusic/app/bloc/music/album/detail/detail_album_state.dart';
import 'package:beemusic/app/model/api_response_model.dart';
import 'package:beemusic/app/model/response/album/detail_album_respon.dart';
import 'package:beemusic/app/utils/constant/enum.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class DetailAlbumCubit extends Cubit<DetailAlbumState> {
  final MusicRepository _musicRepository;

  DetailAlbumCubit({
    required MusicRepository musicRepository,
  })  : _musicRepository = musicRepository,
        super(DetailAlbumInitial());

  void detailAlbumGet(id) async {
    emit(DetailAlbumLoading());
    final ApiResponse response = await _musicRepository.albumDetailGet(id);
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
      var detailAlbumRespon = DetailAlbumResponModel.fromJson(responseBody);
      emit(GetDetailAlbumSuccess(detailAlbumRespon: detailAlbumRespon));
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
        emit(GetDetailAlbumFailed(errorMessage: Status.noconnection.text));
      } catch (e) {
        print("Error decoding JSON: $e");
      }
    } else {
      emit(GetDetailAlbumFailed(errorMessage: errorMessage));
    }
  }
}
