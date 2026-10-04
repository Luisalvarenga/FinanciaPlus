import 'package:dio/dio.dart';

import '../constants/app_constants.dart';
import '../storage/secure_storage_service.dart';
import 'auth_interceptor.dart';

class ApiClient {
  ApiClient(
    this._secureStorage, {
    void Function()? onUnauthorized,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.apiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        // The free hosting plan puts the API to sleep when idle and
        // the first request can take about a minute to wake it up.
        receiveTimeout: const Duration(seconds: 90),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      AuthInterceptor(
        _secureStorage,
        onUnauthorized: onUnauthorized,
      ),
    );
  }

  final SecureStorageService _secureStorage;

  late final Dio _dio;

  Dio get dio => _dio;
}
