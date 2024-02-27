import 'package:beemusic/app/model/response/tophits/detail_tophits_respon.dart';
import 'package:equatable/equatable.dart';

abstract class DetailTopHitsState extends Equatable {
  const DetailTopHitsState();

  @override
  List<Object> get props => [];
}

class DetailTopHitsInitial extends DetailTopHitsState {}

class DetailTopHitsLoading extends DetailTopHitsState {}

class GetDetailTopHitsSuccess extends DetailTopHitsState {
  final DetailTopHitsResponModel detailTopHitsRespon;

  const GetDetailTopHitsSuccess({required this.detailTopHitsRespon});

  @override
  List<Object> get props => [detailTopHitsRespon];
}

class GetDetailTopHitsFailed extends DetailTopHitsState {
  final String errorMessage;

  const GetDetailTopHitsFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
