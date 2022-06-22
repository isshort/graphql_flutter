import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_todo/modules/auth/cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignInPage Title')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          print('state $state');
          if (state is AuthSuccess) {
            return context.go('/');
          } else {
            return context.go('/login');
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              context.read<AuthCubit>().login();
              // BlocProvider.of<AuthCubit>(context).login();
              // context
              //     .read<AuthCubit>()
              //     .login(LoginUser(password: 'password', username: 'username'));
              // print(context.read<AuthCubit>().state);
              // return context.go('/');
            },
            child: const Text('Login to your app'),
          );
        },
      ),
    );
  }
}
