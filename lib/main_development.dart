// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_todo/app/view/app.dart';
import 'package:flutter_graphql_todo/bootstrap.dart';
import 'package:flutter_graphql_todo/core/locator/locator.dart';
import 'package:flutter_graphql_todo/modules/auth/cubit/auth_cubit.dart';

void main() {
  bootstrap(() => BlocProvider(
        create: (context) => sl.get<AuthCubit>()..check(),
        child: const App(),
      ));
  // bootstrap(GoRouterApp.new);
  // bootstrap(() => GoRouterApp());
}
