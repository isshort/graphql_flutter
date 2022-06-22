import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_graphql_todo/core/network/network_info.dart';
import 'package:flutter_graphql_todo/modules/auth/cubit/auth_cubit.dart';
import 'package:flutter_graphql_todo/modules/home/data/repo/home_repo.dart';
import 'package:flutter_graphql_todo/modules/home/pages/logic/cubit/home_cubit.dart';
import 'package:flutter_graphql_todo/modules/home/source/home_remote_source.dart';
import 'package:flutter_graphql_todo/utils/cache/app_token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final sl = GetIt.I;

Future<void> setup(
  GraphQLClient client,
) async {
  sl
        ..registerLazySingleton<Connectivity>(Connectivity.new)
        ..registerLazySingleton<FlutterSecureStorage>(FlutterSecureStorage.new)
        ..registerLazySingleton<NetWorkInfo>(
          () => NetWorkInfo(
            sl<Connectivity>(),
          ),
        )

        /// Cache
        ..registerLazySingleton<AppToken>(
          () => AppToken(sl.get<FlutterSecureStorage>()),
        )
        ..registerLazySingleton<HomeRepository>(
          () => HomeRepositoryImpl(
            sl<HomeRemoteSource>(),
            sl<NetWorkInfo>(),
          ),
        )
        ..registerLazySingleton<HomeRemoteSource>(
          () => HomeRemoteSourceImpl(
            client,
          ),
        )
        ..registerLazySingleton<HomeCubit>(
          () => HomeCubit(
            sl<HomeRepository>(),
          ),
        )

        // Auth
        ..registerLazySingleton<AuthCubit>(
          () => AuthCubit(
            sl.get<AppToken>(),
          ),
        )

      ///other
      ;
}
