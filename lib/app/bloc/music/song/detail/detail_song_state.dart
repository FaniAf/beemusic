import 'package:beemusic/app/model/response/song/detail_song_respon.dart';
import 'package:equatable/equatable.dart';

abstract class DetailSongState extends Equatable {
  const DetailSongState();

  @override
  List<Object> get props => [];
}

class DetailSongInitial extends DetailSongState {}

class DetailSongLoading extends DetailSongState {}

class GetDetailSongSuccess extends DetailSongState {
  final DetailSongResponModel detailSongRespon;

  const GetDetailSongSuccess({required this.detailSongRespon});

  @override
  List<Object> get props => [detailSongRespon];
}

class GetDetailSongFailed extends DetailSongState {
  final String errorMessage;

  const GetDetailSongFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
