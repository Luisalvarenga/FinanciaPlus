import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/repositories/credit_application_repository.dart';
import 'credit_application_state.dart';
import 'onboarding_providers.dart';

final creditApplicationControllerProvider =
    NotifierProvider<
        CreditApplicationController,
        CreditApplicationState>(
  CreditApplicationController.new,
);

class CreditApplicationController
    extends Notifier<CreditApplicationState> {
  late final CreditApplicationRepository
      _creditApplicationRepository;

  @override
  CreditApplicationState build() {
    _creditApplicationRepository =
        ref.read(creditApplicationRepositoryProvider);

    return const CreditApplicationState.initial();
  }

  Future<void> createApplication({
    required double requestedAmount,
  }) async {
    state = const CreditApplicationState.loading();

    try {
      final savedApplication =
          await _creditApplicationRepository
              .createApplication(
        requestedAmount: requestedAmount,
      );

      ref.invalidate(creditApplicationsProvider);

      state = CreditApplicationState.success(
        savedApplication,
      );
    } on DioException catch (exception) {
      final apiException =
          ApiException.fromDioException(exception);

      state = CreditApplicationState.error(
        apiException.message,
      );
    } catch (exception, stackTrace) {
      debugPrint('Credit application error: $exception');
      debugPrint('Stack trace: $stackTrace');

      state = CreditApplicationState.error(
        exception.toString(),
      );
    }
  }

  void reset() {
    state = const CreditApplicationState.initial();
  }
}
