import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_application_response.freezed.dart';
part 'credit_application_response.g.dart';

@freezed
abstract class CreditApplicationResponse
    with _$CreditApplicationResponse {
  const factory CreditApplicationResponse({
    required int id,
    required int clientId,
    required double requestedAmount,
    double? creditScore,
    required bool amlMatch,
    required String status,
    String? ipAddress,
    String? country,
    String? region,
    String? city,
    int? riskScore,
    String? riskLevel,
    DateTime? createdAt,
  }) = _CreditApplicationResponse;

  factory CreditApplicationResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CreditApplicationResponseFromJson(json);
}