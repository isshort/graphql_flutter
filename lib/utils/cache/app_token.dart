import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppToken {
  AppToken(FlutterSecureStorage storage) : _flutterSecureStorage = storage;

  final FlutterSecureStorage _flutterSecureStorage;

  Future<String?> readToken() async {
    return _flutterSecureStorage.read(key: 'token');
  }

  Future<void> setToken(String token) async {
    await _flutterSecureStorage.write(key: 'token', value: token);
  }

  Future<void> removeToken() async {
    await _flutterSecureStorage.delete(key: 'token');
  }
}
