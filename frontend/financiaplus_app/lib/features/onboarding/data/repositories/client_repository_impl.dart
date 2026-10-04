import 'package:dio/dio.dart';

import '../../domain/entities/bank_customer.dart';
import '../../domain/entities/client.dart';
import '../../domain/entities/identity_verification.dart';
import '../../domain/repositories/client_repository.dart';
import '../datasources/client_remote_data_source.dart';
import '../models/client_response.dart';
import '../models/update_profile_request.dart';

class ClientRepositoryImpl implements ClientRepository {
  ClientRepositoryImpl(this._remoteDataSource);

  final ClientRemoteDataSource _remoteDataSource;

  @override
  Future<Client> getCurrentClient() async {
    final response = await _remoteDataSource.getCurrentClient();

    return _mapToDomain(response);
  }

  @override
  Future<Client> updateProfile({
    required String address,
    required DateTime birthDate,
    required String gender,
  }) async {
    final response = await _remoteDataSource.updateProfile(
      UpdateProfileRequest(
        address: address,
        birthDate: _formatDate(birthDate),
        gender: gender,
      ),
    );

    return _mapToDomain(response);
  }

  @override
  Future<IdentityVerification> verifyIdentity() async {
    final response = await _remoteDataSource.verifyIdentity();

    return IdentityVerification(
      similarity: response.similarity,
      approved: response.approved,
      message: response.message,
    );
  }

  @override
  Future<BankCustomer?> findBankCustomer(
    String documentNumber,
  ) async {
    try {
      final response = await _remoteDataSource.getBankCustomer(
        documentNumber,
      );

      return BankCustomer(
        documentNumber: response.documentNumber,
        address: response.address,
        birthDate: DateTime.parse(response.birthDate),
        gender: response.gender,
      );
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 404) {
        return null;
      }

      rethrow;
    }
  }

  Client _mapToDomain(ClientResponse response) {
    final birthDate = response.birthDate;

    return Client(
      id: response.id,
      firstName: response.firstName,
      lastName: response.lastName,
      documentNumber: response.documentNumber,
      email: response.email,
      phone: response.phone ?? '',
      address: response.address,
      birthDate:
          birthDate == null ? null : DateTime.parse(birthDate),
      gender: response.gender,
      profileComplete: response.profileComplete,
      identityVerified: response.identityVerified,
      biometricScore: response.biometricScore,
    );
  }

  // The backend expects dates as yyyy-MM-dd.
  String _formatDate(DateTime date) {
    return date.toIso8601String().substring(0, 10);
  }
}
