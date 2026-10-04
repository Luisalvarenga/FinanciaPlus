import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/credit_application.dart';

part 'credit_application_state.freezed.dart';

@freezed
abstract class CreditApplicationState
    with _$CreditApplicationState {
  const factory CreditApplicationState.initial() =
      CreditApplicationInitial;

  const factory CreditApplicationState.loading() =
      CreditApplicationLoading;

  const factory CreditApplicationState.success(
    CreditApplication application,
  ) = CreditApplicationSuccess;

  const factory CreditApplicationState.error(
    String message,
  ) = CreditApplicationError;
}