import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource(this._dio);

  final Dio _dio;

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _dio.post(
      ApiEndpoints.login,
      data: request.toJson(),
    );

    return LoginResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  Future<LoginResponse> register(RegisterRequest request) async {
    final response = await _dio.post(
      ApiEndpoints.register,
      data: request.toJson(),
    );

    return LoginResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
