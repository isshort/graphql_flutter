import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:graphql_flutter/app/app_router.dart';
import 'package:graphql_flutter/core/locator/locator.dart';
import 'package:graphql_flutter/l10n/l10n.dart';
import 'package:graphql_flutter/modules/auth/logic/cubit/auth_cubit.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp.router(
        routeInformationParser:
            RouteGenrate().customRouter.routeInformationParser,
        routerDelegate: RouteGenrate().customRouter.routerDelegate,
        title: 'Flutter GraphQl',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        // home: const CounterPage(),
      ),
    );
  }
}
