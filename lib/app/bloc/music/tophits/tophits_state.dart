import 'package:beemusic/app/model/response/tophits/tophits_respon.dart';
import 'package:equatable/equatable.dart';

abstract class TopHitsState extends Equatable {
  const TopHitsState();

  @override
  List<Object> get props => [];
}

class TopHitsInitial extends TopHitsState {}

class TopHitsLoading extends TopHitsState {}

class GetTopHitsSuccess extends TopHitsState {
  final TopHitsResponModel topHitsRespon;

  const GetTopHitsSuccess({required this.topHitsRespon});

  @override
  List<Object> get props => [topHitsRespon];
}

class GetTopHitsFailed extends TopHitsState {
  final String errorMessage;

  const GetTopHitsFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
