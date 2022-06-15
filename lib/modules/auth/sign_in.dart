import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/modules/auth/logic/cubit/auth_cubit.dart';
import 'package:graphql_flutter/modules/auth/model/login_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignInPage Title')),
      body: ElevatedButton(
        onPressed: () {
          BlocProvider.of<AuthCubit>(context)
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
