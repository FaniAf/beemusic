import 'package:beemusic/app/model/response/artist/artist_respon.dart';
import 'package:equatable/equatable.dart';

abstract class ArtistState extends Equatable {
  const ArtistState();

  @override
  List<Object> get props => [];
}

class ArtistInitial extends ArtistState {}

class ArtistLoading extends ArtistState {}

class GetArtistSuccess extends ArtistState {
  final ArtistResponModel artistRespon;

  const GetArtistSuccess({required this.artistRespon});

  @override
  List<Object> get props => [artistRespon];
}

class GetArtistFailed extends ArtistState {
  final String errorMessage;

  const GetArtistFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
