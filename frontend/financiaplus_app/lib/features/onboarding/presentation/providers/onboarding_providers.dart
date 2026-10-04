import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/network/network_providers.dart';
import '../../../authentication/presentation/providers/auth_controller.dart';
import '../../../authentication/presentation/providers/auth_state.dart';
import '../../data/datasources/client_remote_data_source.dart';
import '../../data/datasources/credit_application_local_data_source.dart';
import '../../data/datasources/credit_application_remote_data_source.dart';
import '../../data/repositories/client_repository_impl.dart';
import '../../data/repositories/credit_application_repository_impl.dart';
import '../../domain/entities/client.dart';
import '../../domain/entities/credit_application.dart';
import '../../domain/repositories/client_repository.dart';
import '../../domain/repositories/credit_application_repository.dart';

final clientRemoteDataSourceProvider =
    Provider<ClientRemoteDataSource>((ref) {
  return ClientRemoteDataSource(
    ref.watch(dioProvider),
  );
});

final clientRepositoryProvider =
    Provider<ClientRepository>((ref) {
  return ClientRepositoryImpl(
    ref.watch(clientRemoteDataSourceProvider),
  );
});

final creditApplicationLocalDataSourceProvider =
    Provider<CreditApplicationLocalDataSource>((ref) {
  return CreditApplicationLocalDataSource(
    ref.watch(appDatabaseProvider),
  );
});

final creditApplicationRemoteDataSourceProvider =
    Provider<CreditApplicationRemoteDataSource>((ref) {
  return CreditApplicationRemoteDataSource(
    ref.watch(dioProvider),
  );
});

final creditApplicationRepositoryProvider =
    Provider<CreditApplicationRepository>((ref) {
  return CreditApplicationRepositoryImpl(
    ref.watch(
      creditApplicationLocalDataSourceProvider,
    ),
    ref.watch(
      creditApplicationRemoteDataSourceProvider,
    ),
  );
});

/// The signed-in person. It is reloaded whenever the session
/// changes, so one account never sees another account's data.
final currentClientProvider =
    FutureProvider.autoDispose<Client>(
  (ref) async {
    _requireSession(ref);

    final repository =
        ref.watch(clientRepositoryProvider);

    return repository.getCurrentClient();
  },
  retry: (retryCount, error) => null,
);

/// Applications of the signed-in person, newest first.
final creditApplicationsProvider =
    FutureProvider.autoDispose<List<CreditApplication>>(
  (ref) async {
    _requireSession(ref);

    final repository =
        ref.watch(creditApplicationRepositoryProvider);

    return repository.getApplications();
  },
  retry: (retryCount, error) => null,
);

void _requireSession(Ref ref) {
  final isAuthenticated =
      ref.watch(authControllerProvider).maybeWhen(
            authenticated: (_) => true,
            orElse: () => false,
          );

  if (!isAuthenticated) {
    throw StateError('There is no active session.');
  }
}
