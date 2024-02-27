import 'package:beemusic/app/model/response/song/song_respon.dart';
import 'package:equatable/equatable.dart';

abstract class SongState extends Equatable {
  const SongState();

  @override
  List<Object> get props => [];
}

class SongInitial extends SongState {}

class SongLoading extends SongState {}

class GetSongSuccess extends SongState {
  final SongResponModel songRespon;

  const GetSongSuccess({required this.songRespon});

  @override
  List<Object> get props => [songRespon];
}

class GetSongFailed extends SongState {
  final String errorMessage;

  const GetSongFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
