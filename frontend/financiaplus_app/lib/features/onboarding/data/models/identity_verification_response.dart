import 'package:freezed_annotation/freezed_annotation.dart';

part 'identity_verification_response.freezed.dart';
part 'identity_verification_response.g.dart';

@freezed
abstract class IdentityVerificationResponse
    with _$IdentityVerificationResponse {
  const factory IdentityVerificationResponse({
    required double similarity,
    required bool approved,
    required String message,
  }) = _IdentityVerificationResponse;

  factory IdentityVerificationResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$IdentityVerificationResponseFromJson(json);
}
