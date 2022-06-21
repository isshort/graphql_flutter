import 'package:flutter_graphql_todo/core/api/api_constant.dart';
import 'package:http/http.dart';

class ApiClient {
  ApiClient({required Client client}) : _client = client;
  final Client _client;

  Future<Map<String, String>> getheader() async {
    return <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json',
    };
  }

  Uri buildUri({Map<String, dynamic>? params}) {
    final data = Uri(
      scheme: ApiConst.scheme,
      host: ApiConst.host,
      path: 'graphql/',
      queryParameters: params,
    );
    return data;
  }

  Future<dynamic> post(String query) async {
    final _request = await _client.post(
      buildUri(),
      body: query,
      headers: await getheader(),
    );

    print(_request);
  }
}
