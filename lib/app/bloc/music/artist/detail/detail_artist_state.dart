import 'package:beemusic/app/model/response/artist/detail_artist_respon.dart';
import 'package:equatable/equatable.dart';

abstract class DetailArtistState extends Equatable {
  const DetailArtistState();

  @override
  List<Object> get props => [];
}

class DetailArtistInitial extends DetailArtistState {}

class DetailArtistLoading extends DetailArtistState {}

class GetDetailArtistSuccess extends DetailArtistState {
  final DetailArtistResponModel detailartistRespon;

  const GetDetailArtistSuccess({required this.detailartistRespon});

  @override
  List<Object> get props => [detailartistRespon];
}

class GetDetailArtistFailed extends DetailArtistState {
  final String errorMessage;

  const GetDetailArtistFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
