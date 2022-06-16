// To parse this JSON data, do
//
//     final tokenResponse = tokenResponseFromJson(jsonString);

import 'dart:convert';

TokenResponse tokenResponseFromJson(String str) =>
    TokenResponse.fromJson(json.decode(str) as Map<String, String>);

// String tokenResponseToJson(TokenResponse data) => json.encode(data.toJson());

class TokenResponse {
  TokenResponse({
    this.token,
    this.refreshToken,
    this.csrfToken,
    this.errors,
  });

  final String? token;
  final String? refreshToken;
  final String? csrfToken;
  final List<Error>? errors;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
        token: json['token'] as String,
        refreshToken: json['refreshToken'] as String,
        csrfToken: json['csrfToken'] as String,
        errors: List<Error>.from(
          // ignore: avoid_dynamic_calls
          json['errors'].map(Error.fromJson) as Iterable<dynamic>,
        ),
      );

  // Map<String, dynamic> toJson() => <String,String?>{
  //     'token': token,
  //     'refreshToken': refreshToken,
  //     'csrfToken': csrfToken,
  //     'errors': List<dynamic>.from(errors.map((x) => x.toJson())),
  // };
}

class Error {
  Error({
    this.code,
    this.field,
  });

  final String? code;
  final String? field;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json['code'] as String,
        field: json['field'] as String,
      );

  Map<String, dynamic> toJson() => <String, String?>{
        'code': code,
        'field': field,
      };
}
