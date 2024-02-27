import 'dart:io';

import 'package:beemusic/app/api/repo/music/music_repository.dart';
import 'package:beemusic/app/bloc/music/discover/detail/detail_discover_state.dart';
import 'package:beemusic/app/bloc/music/discover/discover_state.dart';
import 'package:beemusic/app/model/api_response_model.dart';
import 'package:beemusic/app/model/response/discover/detail_discover_respon.dart';
import 'package:beemusic/app/model/response/discover/discover_respon.dart';
import 'package:beemusic/app/utils/constant/enum.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class DetailDiscoverCubit extends Cubit<DetailDiscoverState> {
  final MusicRepository _musicRepository;

  DetailDiscoverCubit({
    required MusicRepository musicRepository,
  })  : _musicRepository = musicRepository,
        super(DetailDiscoverInitial());

  void discoverGet(id) async {
    emit(DetailDiscoverLoading());
    final ApiResponse response = await _musicRepository.discoverDetailGet(id);
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
      var discoverRespon = DetailDiscoverResponModel.fromJson(responseBody);
      emit(GetDetailDiscoverSuccess(detailDiscoverRespon: discoverRespon));
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
        emit(GetDetailDiscoverFailed(errorMessage: Status.noconnection.text));
      } catch (e) {
        print("Error decoding JSON: $e");
      }
    } else {
      emit(GetDetailDiscoverFailed(errorMessage: errorMessage));
    }
  }
}
