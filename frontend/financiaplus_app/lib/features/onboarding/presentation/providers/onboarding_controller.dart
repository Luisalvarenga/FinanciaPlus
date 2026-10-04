import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/entities/bank_customer.dart';
import '../../domain/entities/identity_verification.dart';
import '../../domain/repositories/client_repository.dart';
import 'onboarding_providers.dart';
import 'onboarding_state.dart';

final onboardingControllerProvider =
    NotifierProvider<OnboardingController, OnboardingState>(
  OnboardingController.new,
);

class OnboardingController extends Notifier<OnboardingState> {
  late final ClientRepository _clientRepository;

  @override
  OnboardingState build() {
    _clientRepository = ref.read(clientRepositoryProvider);

    return const OnboardingState.initial();
  }

  /// Returns the bank's data for an existing customer, or null
  /// when the person is not a customer or the lookup fails.
  /// The form stays usable either way, so the state is untouched.
  Future<BankCustomer?> findBankCustomer(
    String documentNumber,
  ) async {
    try {
      return await _clientRepository.findBankCustomer(
        documentNumber.trim(),
      );
    } catch (exception) {
      return null;
    }
  }

  Future<void> saveProfile({
    required String address,
    required DateTime birthDate,
    required String gender,
  }) async {
    state = const OnboardingState.loading();

    try {
      final client = await _clientRepository.updateProfile(
        address: address.trim(),
        birthDate: birthDate,
        gender: gender,
      );

      ref.invalidate(currentClientProvider);

      state = OnboardingState.success(client);
    } on DioException catch (exception) {
      state = OnboardingState.error(
        ApiException.fromDioException(exception).message,
      );
    } catch (exception) {
      state = const OnboardingState.error(
        'No se pudo guardar tu información.',
      );
    }
  }

  /// Returns null when the verification could not be completed;
  /// the reason is published as an error state.
  Future<IdentityVerification?> verifyIdentity() async {
    try {
      final verification =
          await _clientRepository.verifyIdentity();

      ref.invalidate(currentClientProvider);

      return verification;
    } on DioException catch (exception) {
      state = OnboardingState.error(
        ApiException.fromDioException(exception).message,
      );

      return null;
    } catch (exception) {
      state = const OnboardingState.error(
        'No se pudo verificar tu identidad.',
      );

      return null;
    }
  }

  void reset() {
    state = const OnboardingState.initial();
  }
}
