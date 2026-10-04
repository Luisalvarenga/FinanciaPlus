import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../models/bank_customer_response.dart';
import '../models/client_response.dart';
import '../models/identity_verification_response.dart';
import '../models/update_profile_request.dart';

class ClientRemoteDataSource {
  ClientRemoteDataSource(this._dio);

  final Dio _dio;

  Future<ClientResponse> getCurrentClient() async {
    final response = await _dio.get(
      ApiEndpoints.currentClient,
    );

    return ClientResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  Future<ClientResponse> updateProfile(
    UpdateProfileRequest request,
  ) async {
    final response = await _dio.put(
      ApiEndpoints.currentClient,
      data: request.toJson(),
    );

    return ClientResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  Future<IdentityVerificationResponse> verifyIdentity() async {
    final response = await _dio.post(
      ApiEndpoints.identityVerification,
    );

    return IdentityVerificationResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  Future<BankCustomerResponse> getBankCustomer(
    String documentNumber,
  ) async {
    final response = await _dio.get(
      '${ApiEndpoints.bankCustomers}/'
      '${Uri.encodeComponent(documentNumber)}',
    );

    return BankCustomerResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
