import 'package:flutter_graphql_todo/modules/auth/logic/login/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> setup() async {
  sl

        /// auth

        ..registerLazySingleton<LoginCubit>(() => LoginCubit())

      //another
      ;
}
