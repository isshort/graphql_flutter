part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({this.loginUser});
  final LoginUser? loginUser;
  @override
  List<Object?> get props => [loginUser];
}
