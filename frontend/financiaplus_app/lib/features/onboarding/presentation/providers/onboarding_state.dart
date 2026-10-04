import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/client.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = OnboardingInitial;

  const factory OnboardingState.loading() = OnboardingLoading;

  const factory OnboardingState.success(Client client) =
      OnboardingSuccess;

  const factory OnboardingState.error(String message) =
      OnboardingError;
}