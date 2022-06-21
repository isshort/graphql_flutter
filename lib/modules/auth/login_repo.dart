import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_todo/modules/auth/logic/login/cubit/login_cubit.dart';
import 'package:flutter_graphql_todo/modules/auth/model/login_model.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignInPage Title')),
      body: ElevatedButton(
        onPressed: () {
          BlocProvider.of<LoginCubit>(context)
              .login(LoginUser(password: 'password', username: 'username'));
          // context
          //     .read<AuthCubit>()
          //     .login(LoginUser(password: 'password', username: 'username'));
          // print(context.read<AuthCubit>().state);
          return context.go('/');
        },
        child: const Text('Home Page'),
      ),
    );
  }
}
