import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_customer_response.freezed.dart';
part 'bank_customer_response.g.dart';

@freezed
abstract class BankCustomerResponse with _$BankCustomerResponse {
  const factory BankCustomerResponse({
    required String documentNumber,
    required String firstName,
    required String lastName,
    required String address,
    required String birthDate,
    required String gender,
    required String email,
    String? phone,
  }) = _BankCustomerResponse;

  factory BankCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$BankCustomerResponseFromJson(json);
}
