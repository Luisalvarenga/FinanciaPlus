import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_credit_application_request.freezed.dart';
part 'create_credit_application_request.g.dart';

@freezed
abstract class CreateCreditApplicationRequest
    with _$CreateCreditApplicationRequest {
  const factory CreateCreditApplicationRequest({
    required double requestedAmount,
  }) = _CreateCreditApplicationRequest;

  factory CreateCreditApplicationRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CreateCreditApplicationRequestFromJson(json);
}
