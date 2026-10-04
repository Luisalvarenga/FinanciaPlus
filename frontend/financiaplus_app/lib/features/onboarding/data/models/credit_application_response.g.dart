// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_application_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditApplicationResponse _$CreditApplicationResponseFromJson(
  Map<String, dynamic> json,
) => _CreditApplicationResponse(
  id: (json['id'] as num).toInt(),
  clientId: (json['clientId'] as num).toInt(),
  requestedAmount: (json['requestedAmount'] as num).toDouble(),
  creditScore: (json['creditScore'] as num?)?.toDouble(),
  amlMatch: json['amlMatch'] as bool,
  status: json['status'] as String,
  ipAddress: json['ipAddress'] as String?,
  country: json['country'] as String?,
  region: json['region'] as String?,
  city: json['city'] as String?,
  riskScore: (json['riskScore'] as num?)?.toInt(),
  riskLevel: json['riskLevel'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$CreditApplicationResponseToJson(
  _CreditApplicationResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'clientId': instance.clientId,
  'requestedAmount': instance.requestedAmount,
  'creditScore': instance.creditScore,
  'amlMatch': instance.amlMatch,
  'status': instance.status,
  'ipAddress': instance.ipAddress,
  'country': instance.country,
  'region': instance.region,
  'city': instance.city,
  'riskScore': instance.riskScore,
  'riskLevel': instance.riskLevel,
  'createdAt': instance.createdAt?.toIso8601String(),
};
