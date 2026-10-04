// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IdentityVerificationResponse _$IdentityVerificationResponseFromJson(
  Map<String, dynamic> json,
) => _IdentityVerificationResponse(
  similarity: (json['similarity'] as num).toDouble(),
  approved: json['approved'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$IdentityVerificationResponseToJson(
  _IdentityVerificationResponse instance,
) => <String, dynamic>{
  'similarity': instance.similarity,
  'approved': instance.approved,
  'message': instance.message,
};
