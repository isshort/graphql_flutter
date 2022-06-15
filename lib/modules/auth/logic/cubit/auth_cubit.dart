import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/modules/auth/model/login_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with ChangeNotifier {
  AuthCubit() : super(const AuthState());

  // bool? get loggedIn => state.loginUser?.username.isNotEmpty;
  bool? get loggedIn {
    final data = state.loginUser?.username.isNotEmpty;
    print("data $data");
    print("state is ${state.loginUser?.username}");
    return data;
  }

  Future<void> login(LoginUser loginUser) async {
    emit(AuthState(loginUser: loginUser));
  }

  Future<void> logout() async {
    emit(const AuthState());
  }
}
