import 'package:flutter_graphql_todo/utils/enums/pagination.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

mixin GraphQlMixin {
  GraphQLClient get client;

  Future<QueryResult> query(String body) async {
    final data = await client.query(
      QueryOptions(
        document: gql(body),
      ),
    );
    // print("your data is ${data.data}");
    return data;
  }

  Future<List<T>> response<T>(
    QueryResult<Object?> response,
    T Function(Map<String, dynamic>) fromJson,
    String param1,
    String param2,
  ) async {
    try {
      if (response.data != null) {
        final responseResult = response.data?[param1][param2] as List<Object?>;
        return responseResult
            .map<T>(
              (e) => fromJson(e! as Map<String, String>),
            )
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<QueryResult> queryPage(int page, String body) async {
    return client.query(
      QueryOptions(
        document: gql(body),
        variables: <String, dynamic>{PageEnum.page.getName(): page},
      ),
    );
  }

  Future<QueryResult> mutation(String body) async {
    return client.mutate(
      MutationOptions(
        document: gql(body),
      ),
    );
  }
}
