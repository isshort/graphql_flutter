import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/modules/auth/logic/cubit/auth_cubit.dart';

final sl = GetIt.I;

Future<void> setup() async {
  sl

        /// auth

        ..registerLazySingleton<AuthCubit>(() => AuthCubit())

      //another
      ;
}
