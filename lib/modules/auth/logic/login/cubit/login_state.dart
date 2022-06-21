part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({this.loginUser});
  final LoginUser? loginUser;
  @override
  List<Object?> get props => [loginUser];
}
