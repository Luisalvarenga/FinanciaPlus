import '../entities/auth_session.dart';

abstract class AuthRepository {
  Future<AuthSession> login({
    required String email,
    required String password,
  });

  Future<AuthSession> register({
    required String firstName,
    required String lastName,
    required String documentNumber,
    required String email,
    required String phone,
    required String password,
  });
}
