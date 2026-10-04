import '../../domain/entities/credit_application.dart';
import '../../domain/repositories/credit_application_repository.dart';
import '../datasources/credit_application_local_data_source.dart';
import '../datasources/credit_application_remote_data_source.dart';
import '../models/create_credit_application_request.dart';
import '../models/credit_application_response.dart';

class CreditApplicationRepositoryImpl
    implements CreditApplicationRepository {
  CreditApplicationRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  final CreditApplicationLocalDataSource _localDataSource;
  final CreditApplicationRemoteDataSource _remoteDataSource;

  @override
  Future<CreditApplication> createApplication({
    required double requestedAmount,
  }) async {
    final response =
        await _remoteDataSource.createApplication(
      CreateCreditApplicationRequest(
        requestedAmount: requestedAmount,
      ),
    );

    final localId =
        await _localDataSource.insertApplication(
      clientId: response.clientId,
      serverId: response.id,
      requestedAmountCents:
          (response.requestedAmount * 100).round(),
      creditScore: response.creditScore,
      amlMatch: response.amlMatch,
      status: response.status,
      ipAddress: response.ipAddress,
      country: response.country,
      region: response.region,
      city: response.city,
      createdAt: response.createdAt,
    );

    return _mapToDomain(response).copyWith(
      localId: localId,
    );
  }

  @override
  Future<List<CreditApplication>> getApplications() async {
    final responses =
        await _remoteDataSource.getApplications();

    return responses.map(_mapToDomain).toList();
  }

  CreditApplication _mapToDomain(
    CreditApplicationResponse response,
  ) {
    return CreditApplication(
      serverId: response.id,
      clientId: response.clientId,
      requestedAmount: response.requestedAmount,
      creditScore: response.creditScore,
      amlMatch: response.amlMatch,
      status: response.status,
      ipAddress: response.ipAddress,
      country: response.country,
      region: response.region,
      city: response.city,
      riskScore: response.riskScore,
      riskLevel: response.riskLevel,
      createdAt: response.createdAt,
    );
  }
}
