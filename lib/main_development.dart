// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_graphql_todo/app/view/app.dart';
import 'package:flutter_graphql_todo/bootstrap.dart';
import 'package:http/http.dart';

import 'core/api/api_client.dart';
import 'modules/auth/graphql/queries.dart';

void main() {
  bootstrap(() => App());
  // bootstrap(GoRouterApp.new);
  // bootstrap(() => GoRouterApp());
}
