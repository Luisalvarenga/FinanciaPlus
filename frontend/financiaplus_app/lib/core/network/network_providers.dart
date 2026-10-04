import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/authentication/presentation/providers/auth_controller.dart';
import '../storage/storage_providers.dart';
import 'api_client.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(
    ref.watch(secureStorageProvider),
    // An expired session sends the user back to the login screen.
    onUnauthorized: () {
      ref.read(authControllerProvider.notifier).logout();
    },
  );
});

final dioProvider = Provider<Dio>((ref) {
  return ref.watch(apiClientProvider).dio;
});
