import 'package:flutter/cupertino.dart';
import 'package:flutter_graphql_todo/counter/counter.dart';
import 'package:flutter_graphql_todo/modules/auth/logic/login/cubit/login_cubit.dart';
import 'package:flutter_graphql_todo/modules/auth/login_repo.dart';
import 'package:flutter_graphql_todo/modules/auth/sign_up.dart';

import 'package:go_router/go_router.dart';

import '../modules/home/home.dart';

class RouteGenrate {
  RouteGenrate();

  GoRouter get customRouter => _goRouter;

  final authCubit = LoginCubit();

  late final _goRouter = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/counter',
        builder: (BuildContext context, GoRouterState state) =>
            const CounterPage(),
      ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) =>
            const SignInPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpPage(),
      ),
    ],
    redirect: (state) {
      // final loggedIn = authCubit.loggedIn;
      // final isLogging = state.subloc == '/login';
      // // if (loggedIn != true) {
      // //   print("autcubit ${authCubit.loggedIn}");
      // // }
      // if (loggedIn != true) {
      //   return isLogging ? null : '/login';
      // }
      // if (isLogging) return '/';
      return null;
    },
    refreshListenable: authCubit,
  );
}
