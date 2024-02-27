import 'package:beemusic/app/model/response/discover/detail_discover_respon.dart';
import 'package:equatable/equatable.dart';

abstract class DetailDiscoverState extends Equatable {
  const DetailDiscoverState();

  @override
  List<Object> get props => [];
}

class DetailDiscoverInitial extends DetailDiscoverState {}

class DetailDiscoverLoading extends DetailDiscoverState {}

class GetDetailDiscoverSuccess extends DetailDiscoverState {
  final DetailDiscoverResponModel detailDiscoverRespon;

  const GetDetailDiscoverSuccess({required this.detailDiscoverRespon});

  @override
  List<Object> get props => [detailDiscoverRespon];
}

class GetDetailDiscoverFailed extends DetailDiscoverState {
  final String errorMessage;

  const GetDetailDiscoverFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
