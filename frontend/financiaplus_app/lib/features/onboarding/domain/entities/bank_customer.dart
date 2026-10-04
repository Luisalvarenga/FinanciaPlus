import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_customer.freezed.dart';

/// Data the bank already holds for an existing customer,
/// used to fill in the onboarding form automatically.
@freezed
abstract class BankCustomer with _$BankCustomer {
  const factory BankCustomer({
    required String documentNumber,
    required String address,
    required DateTime birthDate,
    required String gender,
  }) = _BankCustomer;
}
