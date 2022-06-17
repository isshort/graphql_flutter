import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_todo/core/exceptions/error_handle.dart';
import 'package:flutter_graphql_todo/core/exceptions/exception_message.dart';
import 'package:flutter_graphql_todo/core/network/network_info.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

mixin RepositoryMixin {
  NetWorkInfo get netWorkInfo;

  Future<Either<Exception, List<R>>> responsePage<R>(
    Future<List<R>> Function(int page) getRemote,
    Future<void> Function(List<R> models, int page) cache,
    List<R>? Function(int page) getLocal,
    int page,
  ) async {
    if (await netWorkInfo.isConncted()) {
      try {
        final _model = await getRemote(page);
        await cache(_model, page);
        return Right(_model);
      } catch (e) {
        return Left(ExceptionMessage('e'));
      }
    } else {
      try {
        final _models = getLocal(page);
        return Right(_models ?? []);
      } catch (e) {
        return Left(ExceptionMessage('$e'));
      }
    }
  }

  /// response is

  Future<Either<Exception, List<R>>> response<R>(
    Future<List<R>> Function() getRemote,
    // Future<void> Function(List<R> models) cache,
    // List<R>? Function() getLocal,
  ) async {
    if (await netWorkInfo.isConncted()) {
      try {
        final _models = await getRemote();
        // await cache(_models);
        return Right(_models);
      } catch (e) {
        return Left(ExceptionMessage('$e'));
      }
    } else {
      try {
        // final _models = getLocal();
        // return Right(_models ?? []);
        return Right([]);
      } catch (e) {
        return Left(ExceptionMessage('$e'));
      }
    }
  }
}
