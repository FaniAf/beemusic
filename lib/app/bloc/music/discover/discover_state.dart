import 'package:beemusic/app/model/response/discover/discover_respon.dart';
import 'package:equatable/equatable.dart';

abstract class DiscoverState extends Equatable {
  const DiscoverState();

  @override
  List<Object> get props => [];
}

class DiscoverInitial extends DiscoverState {}

class DiscoverLoading extends DiscoverState {}

class GetDiscoverSuccess extends DiscoverState {
  final DiscoverResponModel discoverRespon;

  const GetDiscoverSuccess({required this.discoverRespon});

  @override
  List<Object> get props => [discoverRespon];
}

class GetDiscoverFailed extends DiscoverState {
  final String errorMessage;

  const GetDiscoverFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
