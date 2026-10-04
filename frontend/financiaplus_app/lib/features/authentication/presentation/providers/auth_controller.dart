import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/storage/storage_providers.dart';
import 'auth_providers.dart';
import 'auth_state.dart';

final authControllerProvider =
    NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

class AuthController extends Notifier<AuthState> {
  late final AuthRepository _authRepository;
  late final SecureStorageService _secureStorage;

  @override
  AuthState build() {
    _authRepository = ref.read(authRepositoryProvider);
    _secureStorage = ref.read(secureStorageProvider);

    return const AuthState.initial();
  }

  Future<void> restoreSession() async {
    state = const AuthState.loading();

    try {
      final token = await _secureStorage.getAccessToken();
      final tokenType = await _secureStorage.getTokenType();

      if (token == null || token.isEmpty) {
        state = const AuthState.unauthenticated();
        return;
      }

      final session = AuthSession(
        token: token,
        tokenType: tokenType ?? 'Bearer',
      );

      state = AuthState.authenticated(session);
    } catch (exception) {
      state = AuthState.error(exception.toString());
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) {
    return _authenticate(
      () => _authRepository.login(
        email: email,
        password: password,
      ),
    );
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String documentNumber,
    required String email,
    required String phone,
    required String password,
  }) {
    return _authenticate(
      () => _authRepository.register(
        firstName: firstName,
        lastName: lastName,
        documentNumber: documentNumber,
        email: email,
        phone: phone,
        password: password,
      ),
    );
  }

  Future<void> logout() async {
    await _secureStorage.clearSession();

    state = const AuthState.unauthenticated();
  }

  Future<void> _authenticate(
    Future<AuthSession> Function() request,
  ) async {
    state = const AuthState.loading();

    try {
      final session = await request();

      await _secureStorage.saveSession(
        token: session.token,
        tokenType: session.tokenType,
      );

      state = AuthState.authenticated(session);
    } on DioException catch (exception) {
      state = AuthState.error(
        ApiException.fromDioException(exception).message,
      );
    } catch (exception) {
      state = AuthState.error(exception.toString());
    }
  }
}
