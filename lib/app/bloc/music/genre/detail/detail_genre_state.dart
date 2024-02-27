import 'package:beemusic/app/model/response/genre/detail_genre_respon.dart';
import 'package:equatable/equatable.dart';

abstract class DetailGenreState extends Equatable {
  const DetailGenreState();

  @override
  List<Object> get props => [];
}

class DetailGenreInitial extends DetailGenreState {}

class DetailGenreLoading extends DetailGenreState {}

class GetDetailGenreSuccess extends DetailGenreState {
  final DetailGenreResponModel detailGenreRespon;

  const GetDetailGenreSuccess({required this.detailGenreRespon});

  @override
  List<Object> get props => [detailGenreRespon];
}

class GetDetailGenreFailed extends DetailGenreState {
  final String errorMessage;

  const GetDetailGenreFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
