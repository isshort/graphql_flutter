import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/core/locator/locator.dart';
import 'package:graphql_flutter/counter/counter.dart';
import 'package:graphql_flutter/modules/auth/logic/cubit/auth_cubit.dart';
import 'package:graphql_flutter/modules/auth/model/login_model.dart';
import 'package:graphql_flutter/modules/auth/sign_in.dart';
import 'package:graphql_flutter/modules/auth/sign_up.dart';
import 'package:graphql_flutter/modules/home/home.dart';

class RouteGenrate {
  RouteGenrate();

  GoRouter get customRouter => _goRouter;

  final authCubit = AuthCubit();

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
      final loggedIn = authCubit.loggedIn;
      final isLogging = state.subloc == '/login';
      // if (loggedIn != true) {
      //   print("autcubit ${authCubit.loggedIn}");
      // }
      if (loggedIn != true) {
        return isLogging ? null : '/login';
      }
      // if (isLogging) return '/';
      return null;
    },
    refreshListenable: authCubit,
  );
}
