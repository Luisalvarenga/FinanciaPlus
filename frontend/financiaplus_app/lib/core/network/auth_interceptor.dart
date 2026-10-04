import 'package:dio/dio.dart';

import '../storage/secure_storage_service.dart';
import 'api_endpoints.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(
    this._secureStorage, {
    this.onUnauthorized,
  });

  final SecureStorageService _secureStorage;

  /// Called when the API rejects the stored token.
  final void Function()? onUnauthorized;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorage.getAccessToken();
    final tokenType = await _secureStorage.getTokenType();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] =
          '${tokenType ?? 'Bearer'} $token';
    }

    handler.next(options);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    // A 401 on login or sign-up means wrong credentials,
    // not an expired session.
    final isAuthRequest = err.requestOptions.path.startsWith(
      ApiEndpoints.auth,
    );

    if (err.response?.statusCode == 401 && !isAuthRequest) {
      onUnauthorized?.call();
    }

    handler.next(err);
  }
}
