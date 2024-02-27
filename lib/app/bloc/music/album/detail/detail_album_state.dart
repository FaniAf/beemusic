import 'package:beemusic/app/model/response/album/detail_album_respon.dart';
import 'package:equatable/equatable.dart';

abstract class DetailAlbumState extends Equatable {
  const DetailAlbumState();

  @override
  List<Object> get props => [];
}

class DetailAlbumInitial extends DetailAlbumState {}

class DetailAlbumLoading extends DetailAlbumState {}

class GetDetailAlbumSuccess extends DetailAlbumState {
  final DetailAlbumResponModel detailAlbumRespon;

  const GetDetailAlbumSuccess({required this.detailAlbumRespon});

  @override
  List<Object> get props => [detailAlbumRespon];
}

class GetDetailAlbumFailed extends DetailAlbumState {
  final String errorMessage;

  const GetDetailAlbumFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
