import 'package:flutter/material.dart';
import 'package:flutter_graphql_todo/counter/counter.dart';
import 'package:flutter_graphql_todo/modules/auth/cubit/auth_cubit.dart';
import 'package:flutter_graphql_todo/modules/auth/login_repo.dart';
import 'package:flutter_graphql_todo/modules/auth/sign_up.dart';
import 'package:flutter_graphql_todo/modules/home/view/main_page.dart';

import 'package:go_router/go_router.dart';

class RouteGenerate {
  RouteGenerate(AuthState authState) : _authState = authState;

  final AuthState _authState;

  late final router = GoRouter(
    // initialLocation: '/initial',
    routes: <GoRoute>[
      // GoRoute(
      //   path: '/initial',
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const InitialPage(),
      // ),
      GoRoute(
        path: '/counter',
        builder: (BuildContext context, GoRouterState state) =>
            const CounterPage(),
      ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const MainPage(),
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
      final loggedIn = _authState is AuthLoggedIn;
      print(_authState);
      final loggingIn = state.subloc == '/login';
      if (!loggedIn) {
        return loggingIn ? null : '/login';
      }
      // if (loggedIn) return '/';
      return null;
    },
    // refreshListenable: authCubit,
  );
}
