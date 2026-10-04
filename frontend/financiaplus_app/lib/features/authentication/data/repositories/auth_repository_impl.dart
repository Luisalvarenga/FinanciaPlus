import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final response = await _remoteDataSource.login(
      LoginRequest(
        email: email,
        password: password,
      ),
    );

    return _mapToDomain(response);
  }

  @override
  Future<AuthSession> register({
    required String firstName,
    required String lastName,
    required String documentNumber,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await _remoteDataSource.register(
      RegisterRequest(
        firstName: firstName,
        lastName: lastName,
        documentNumber: documentNumber,
        email: email,
        phone: phone,
        password: password,
      ),
    );

    return _mapToDomain(response);
  }

  AuthSession _mapToDomain(LoginResponse response) {
    return AuthSession(
      token: response.token,
      tokenType: response.tokenType,
    );
  }
}
