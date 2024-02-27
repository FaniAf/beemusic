import 'package:beemusic/app/model/response/genre/genre_respon.dart';
import 'package:equatable/equatable.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreInitial extends GenreState {}

class GenreLoading extends GenreState {}

class GetGenreSuccess extends GenreState {
  final GenreResponModel genreRespon;

  const GetGenreSuccess({required this.genreRespon});

  @override
  List<Object> get props => [genreRespon];
}

class GetGenreFailed extends GenreState {
  final String errorMessage;

  const GetGenreFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
