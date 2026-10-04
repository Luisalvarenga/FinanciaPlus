// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankCustomerResponse _$BankCustomerResponseFromJson(
  Map<String, dynamic> json,
) => _BankCustomerResponse(
  documentNumber: json['documentNumber'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  address: json['address'] as String,
  birthDate: json['birthDate'] as String,
  gender: json['gender'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$BankCustomerResponseToJson(
  _BankCustomerResponse instance,
) => <String, dynamic>{
  'documentNumber': instance.documentNumber,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'address': instance.address,
  'birthDate': instance.birthDate,
  'gender': instance.gender,
  'email': instance.email,
  'phone': instance.phone,
};
