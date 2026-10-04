import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  SecureStorageService()
      : _storage = const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const String accessTokenKey = 'access_token';
  static const String tokenTypeKey = 'token_type';

  Future<void> saveSession({
    required String token,
    required String tokenType,
  }) async {
    await _storage.write(
      key: accessTokenKey,
      value: token,
    );

    await _storage.write(
      key: tokenTypeKey,
      value: tokenType,
    );
  }

  Future<String?> getAccessToken() {
    return _storage.read(key: accessTokenKey);
  }

  Future<String?> getTokenType() {
    return _storage.read(key: tokenTypeKey);
  }

  Future<void> clearSession() async {
    await _storage.delete(key: accessTokenKey);
    await _storage.delete(key: tokenTypeKey);
  }
}