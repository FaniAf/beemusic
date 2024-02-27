import 'package:beemusic/app/model/response/album/album_respon.dart';
import 'package:equatable/equatable.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class GetAlbumSuccess extends AlbumState {
  final AlbumResponModel albumRespon;

  const GetAlbumSuccess({required this.albumRespon});

  @override
  List<Object> get props => [albumRespon];
}

class GetAlbumFailed extends AlbumState {
  final String errorMessage;

  const GetAlbumFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
