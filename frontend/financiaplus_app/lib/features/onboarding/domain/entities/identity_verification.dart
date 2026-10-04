import 'package:freezed_annotation/freezed_annotation.dart';

part 'identity_verification.freezed.dart';

/// Result of comparing the identity document with the selfie.
@freezed
abstract class IdentityVerification with _$IdentityVerification {
  const factory IdentityVerification({
    required double similarity,
    required bool approved,
    required String message,
  }) = _IdentityVerification;
}
