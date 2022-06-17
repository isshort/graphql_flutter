import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_todo/core/mixin/repo_mixin.dart';
import 'package:flutter_graphql_todo/core/network/network_info.dart';
import 'package:flutter_graphql_todo/modules/home/home.dart';
import 'package:flutter_graphql_todo/modules/home/source/home_remote_source.dart';

abstract class HomeRepository {
  Future<Either<Exception, List<Product>>> getProducts();
}

class HomeRepositoryImpl extends HomeRepository with RepositoryMixin {
  HomeRepositoryImpl(this._remoteSource, this._netWorkInfo);

  final HomeRemoteSource _remoteSource;
  final NetWorkInfo _netWorkInfo;
  @override
  Future<Either<Exception, List<Product>>> getProducts() async {
    return response<Product>(_remoteSource.getProducts);
  }

  @override
  NetWorkInfo get netWorkInfo => _netWorkInfo;
}
