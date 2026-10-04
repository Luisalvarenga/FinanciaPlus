import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';

/// The signed-in person. Address, birth date and gender stay
/// empty until they are completed during the onboarding.
@freezed
abstract class Client with _$Client {
  const factory Client({
    required int id,
    required String firstName,
    required String lastName,
    required String documentNumber,
    required String email,
    required String phone,
    String? address,
    DateTime? birthDate,
    String? gender,
    required bool profileComplete,
    required bool identityVerified,
    double? biometricScore,
  }) = _Client;
}
