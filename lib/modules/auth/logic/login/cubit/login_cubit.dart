import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with ChangeNotifier {
  LoginCubit() : super(const LoginState());

  // bool? get loggedIn => state.loginUser?.username.isNotEmpty;
  bool? get loggedIn {
    final data = state.loginUser?.username.isNotEmpty;
    print("data $data");
    print("state is ${state.loginUser?.username}");
    return data;
  }

  Future<void> login(LoginUser loginUser) async {
    emit(LoginState(loginUser: loginUser));
  }

  Future<void> logout() async {
    emit(const LoginState());
  }
}
