import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_response.freezed.dart';
part 'client_response.g.dart';

@freezed
abstract class ClientResponse with _$ClientResponse {
  const factory ClientResponse({
    required int id,
    required String firstName,
    required String lastName,
    required String documentNumber,
    required String email,
    String? phone,
    String? address,
    String? birthDate,
    String? gender,
    required bool profileComplete,
    required bool identityVerified,
    double? biometricScore,
  }) = _ClientResponse;

  factory ClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientResponseFromJson(json);
}
