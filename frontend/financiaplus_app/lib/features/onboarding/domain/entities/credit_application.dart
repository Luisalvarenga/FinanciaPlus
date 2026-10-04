import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_application.freezed.dart';

@freezed
abstract class CreditApplication
    with _$CreditApplication {
  const factory CreditApplication({
    int? localId,
    int? serverId,
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
  }) = _CreditApplication;
}