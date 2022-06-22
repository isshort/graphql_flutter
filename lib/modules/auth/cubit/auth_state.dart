part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoggedIn extends AuthState {
  const AuthLoggedIn({required this.status});
  final bool status;
  @override
  List<Object> get props => [status];
}

class AuthSuccess extends AuthState {
  const AuthSuccess(this.token);

  final String? token;
  @override
  List<Object?> get props => [token];
}

class AuthEmpty extends AuthState {}
