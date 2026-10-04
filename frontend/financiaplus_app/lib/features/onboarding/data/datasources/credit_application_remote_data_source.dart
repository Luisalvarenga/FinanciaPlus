import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../models/create_credit_application_request.dart';
import '../models/credit_application_response.dart';

class CreditApplicationRemoteDataSource {
  CreditApplicationRemoteDataSource(this._dio);

  final Dio _dio;

  Future<CreditApplicationResponse> createApplication(
    CreateCreditApplicationRequest request,
  ) async {
    final response = await _dio.post(
      ApiEndpoints.creditApplications,
      data: request.toJson(),
    );

    return CreditApplicationResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  Future<List<CreditApplicationResponse>> getApplications() async {
    final response = await _dio.get(
      ApiEndpoints.creditApplications,
    );

    return (response.data as List<dynamic>)
        .map(
          (item) => CreditApplicationResponse.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}
