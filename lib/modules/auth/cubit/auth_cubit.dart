import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_graphql_todo/utils/cache/app_token.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AppToken appToken)
      : _appToken = appToken,
        super(AuthInitial());

  final AppToken _appToken;
  Future<void> check() async {
    return emit(AuthLoggedIn(status: await _appToken.readToken() != null));
  }

  Future<void> login() async {
    await _appToken.setToken('token example');
    emit(AuthLoggedIn(status: await _appToken.readToken() != null));
  }

  Future<void> logout() async {
    await _appToken.removeToken();
    emit(AuthEmpty());
  }
}
