import 'package:dartz/dartz.dart';

import 'package:flutter_graphql_todo/core/exceptions/error_handle.dart';
import 'package:flutter_graphql_todo/modules/auth/model/token_response.dart';

abstract class AuthRepository {
  Future<Either<ErrorHandle, TokenResponse>> refresh(
      String email, String password);
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<ErrorHandle, TokenResponse>> refresh(
      String email, String password) {
    // TODO: implement refresh
    throw UnimplementedError();
  }
}
