part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginModel loginId;
  // final dynamic sub;

  const AuthSuccess({
    required this.loginId,
    // this.sub
  });

  @override
  List<Object> get props => [loginId];
}

class AuthFailed extends AuthState {
  final String errorModel;

  const AuthFailed({required this.errorModel});

  @override
  List<Object> get props => [errorModel];
}

class AuthRecoverSuccess extends AuthState {
  final String token;
  // final dynamic sub;

  const AuthRecoverSuccess({
    required this.token,
    // this.sub
  });

  @override
  List<Object> get props => [token];
}

class AuthRecoverFailed extends AuthState {
  final String errorModel;

  const AuthRecoverFailed({required this.errorModel});

  @override
  List<Object> get props => [errorModel];
}

class SignoutSuccess extends AuthState {}

class SignoutFailed extends AuthState {
  final String errorMessage;

  const SignoutFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
