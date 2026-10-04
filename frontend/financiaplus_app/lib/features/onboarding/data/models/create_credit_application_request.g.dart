// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_credit_application_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateCreditApplicationRequest _$CreateCreditApplicationRequestFromJson(
  Map<String, dynamic> json,
) => _CreateCreditApplicationRequest(
  requestedAmount: (json['requestedAmount'] as num).toDouble(),
);

Map<String, dynamic> _$CreateCreditApplicationRequestToJson(
  _CreateCreditApplicationRequest instance,
) => <String, dynamic>{'requestedAmount': instance.requestedAmount};
