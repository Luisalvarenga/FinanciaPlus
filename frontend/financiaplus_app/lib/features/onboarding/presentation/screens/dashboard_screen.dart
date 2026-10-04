import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../authentication/presentation/providers/auth_controller.dart';
import '../../domain/entities/client.dart';
import '../../domain/entities/credit_application.dart';
import '../providers/credit_application_controller.dart';
import '../providers/onboarding_providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  void _refresh(WidgetRef ref) {
    ref.invalidate(currentClientProvider);
    ref.invalidate(creditApplicationsProvider);
  }

  void _startApplication(BuildContext context, WidgetRef ref) {
    ref
        .read(creditApplicationControllerProvider.notifier)
        .reset();

    context.push('/credit-application');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientState = ref.watch(currentClientProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FinanciaPlus'),
        actions: [
          IconButton(
            tooltip: 'Actualizar',
            onPressed: () => _refresh(ref),
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            tooltip: 'Cerrar sesión',
            onPressed: () {
              ref
                  .read(authControllerProvider.notifier)
                  .logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: clientState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'No se pudo cargar tu información.',
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => _refresh(ref),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (client) => Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Hola, ${client.firstName}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  _buildOnboardingCard(context, client),
                  const SizedBox(height: 24),
                  _buildApplications(context, ref, client),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingCard(
    BuildContext context,
    Client client,
  ) {
    final isComplete =
        client.profileComplete && client.identityVerified;

    final biometricScore = client.biometricScore;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Onboarding',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            _buildStep(
              'Datos personales',
              client.profileComplete,
            ),
            _buildStep(
              biometricScore == null
                  ? 'Verificación de identidad'
                  : 'Verificación de identidad '
                      '(${biometricScore.toStringAsFixed(2)}% de coincidencia)',
              client.identityVerified,
            ),
            const SizedBox(height: 8),
            if (isComplete)
              const Text(
                'Completaste tu onboarding.',
              )
            else
              FilledButton(
                onPressed: () => context.push('/onboarding'),
                child: const Text('Continuar onboarding'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String label, bool isDone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            isDone
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: isDone ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(label),
          ),
        ],
      ),
    );
  }

  Widget _buildApplications(
    BuildContext context,
    WidgetRef ref,
    Client client,
  ) {
    final applicationsState =
        ref.watch(creditApplicationsProvider);

    final canApply =
        client.profileComplete && client.identityVerified;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Mis solicitudes',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            FilledButton.icon(
              onPressed: canApply
                  ? () => _startApplication(context, ref)
                  : null,
              icon: const Icon(Icons.add),
              label: const Text('Nueva solicitud'),
            ),
          ],
        ),
        if (!canApply) ...[
          const SizedBox(height: 8),
          const Text(
            'Completa tu onboarding para solicitar un producto.',
          ),
        ],
        const SizedBox(height: 8),
        applicationsState.when(
          loading: () => const Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, stackTrace) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'No se pudieron cargar tus solicitudes.',
            ),
          ),
          data: (applications) {
            if (applications.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Aún no tienes solicitudes.',
                ),
              );
            }

            return Column(
              children: applications
                  .map(_buildApplication)
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildApplication(CreditApplication application) {
    final createdAt = application.createdAt;

    final details = [
      'Solicitud n.º ${application.serverId}',
      if (createdAt != null)
        createdAt.toIso8601String().substring(0, 10),
    ].join(' · ');

    return Card(
      child: ListTile(
        title: const Text(
          'Cuenta Digital + Tarjeta de Débito',
        ),
        subtitle: Text(details),
        trailing: _buildStatus(application.status),
      ),
    );
  }

  Widget _buildStatus(String status) {
    final String label;
    final Color color;

    switch (status) {
      case 'APPROVED':
        label = 'Aprobada';
        color = Colors.green;
      default:
        label = 'Rechazada';
        color = Colors.red;
    }

    return Chip(
      label: Text(label),
      labelStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide(color: color),
    );
  }
}
