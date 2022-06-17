import 'package:flutter_graphql_todo/core/mixin/graphql_mixin.dart';
import 'package:flutter_graphql_todo/modules/home/home.dart';
import 'package:flutter_graphql_todo/utils/queries/gql_queres.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class HomeRemoteSource {
  Future<List<Product>> getProducts();
}

class HomeRemoteSourceImpl extends HomeRemoteSource with GraphQlMixin {
  HomeRemoteSourceImpl(this._client);

  final GraphQLClient _client;

  @override
  Future<List<Product>> getProducts() async {
    final _res = await query(GraphQlQuery.productQuery);
    return response(_res, Product.fromJson, 'data', 'products');
  }

  @override
  GraphQLClient get client => _client;
}
