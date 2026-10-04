// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientResponse _$ClientResponseFromJson(Map<String, dynamic> json) =>
    _ClientResponse(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      documentNumber: json['documentNumber'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      birthDate: json['birthDate'] as String?,
      gender: json['gender'] as String?,
      profileComplete: json['profileComplete'] as bool,
      identityVerified: json['identityVerified'] as bool,
      biometricScore: (json['biometricScore'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ClientResponseToJson(_ClientResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'documentNumber': instance.documentNumber,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'profileComplete': instance.profileComplete,
      'identityVerified': instance.identityVerified,
      'biometricScore': instance.biometricScore,
    };
