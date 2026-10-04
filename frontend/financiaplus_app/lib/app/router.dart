import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/presentation/providers/auth_controller.dart';
import '../features/authentication/presentation/providers/auth_state.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/register_screen.dart';
import '../features/authentication/presentation/screens/splash_screen.dart';
import '../features/onboarding/presentation/screens/application_result_screen.dart';
import '../features/onboarding/presentation/screens/credit_application_screen.dart';
import '../features/onboarding/presentation/screens/dashboard_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  RouterRefreshNotifier(Ref ref) {
    ref.listen<AuthState>(
      authControllerProvider,
      (_, _) {
        notifyListeners();
      },
    );

    ref.onDispose(dispose);
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = RouterRefreshNotifier(ref);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);

      final isSplash = state.matchedLocation == '/splash';

      // Screens available without a session.
      final isPublic = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      return authState.when(
        initial: () {
          return isSplash ? null : '/splash';
        },
        loading: () {
          // Login and sign-up show their own progress indicator.
          return isSplash || isPublic ? null : '/splash';
        },
        authenticated: (_) {
          if (isSplash || isPublic) {
            return '/dashboard';
          }

          return null;
        },
        unauthenticated: () {
          return isPublic ? null : '/login';
        },
        error: (_) {
          return isPublic ? null : '/login';
        },
      );
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) {
          return const DashboardScreen();
        },
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: '/credit-application',
        builder: (context, state) {
          return const CreditApplicationScreen();
        },
      ),
      GoRoute(
        path: '/application-result',
        builder: (context, state) {
          return const ApplicationResultScreen();
        },
      ),
    ],
  );
});
