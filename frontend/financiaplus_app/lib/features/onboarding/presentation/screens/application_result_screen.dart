import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/credit_application.dart';
import '../providers/credit_application_controller.dart';
import '../providers/credit_application_state.dart';

class ApplicationResultScreen extends ConsumerWidget {
  const ApplicationResultScreen({super.key});

  void _backToDashboard(
    BuildContext context,
    WidgetRef ref,
  ) {
    context.go('/dashboard');

    ref
        .read(creditApplicationControllerProvider.notifier)
        .reset();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final application = ref
        .watch(creditApplicationControllerProvider)
        .maybeWhen(
          success: (application) => application,
          orElse: () => null,
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado de la solicitud'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: application == null
                ? _buildMissingResult(context)
                : _buildResult(context, ref, application),
          ),
        ),
      ),
    );
  }

  Widget _buildMissingResult(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'No hay ningún resultado que mostrar.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => context.go('/dashboard'),
          child: const Text('Volver a mis solicitudes'),
        ),
      ],
    );
  }

  Widget _buildResult(
    BuildContext context,
    WidgetRef ref,
    CreditApplication application,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final IconData icon;
    final Color color;
    final String title;
    final String message;

    switch (application.status) {
      case 'APPROVED':
        icon = Icons.check_circle;
        color = Colors.green;
        title = 'Proceso finalizado con éxito';
        message =
            'Tu solicitud de Cuenta Digital y Tarjeta de Débito '
            'fue aprobada.';
      case 'REJECTED_CREDIT_SCORE':
        icon = Icons.cancel;
        color = colorScheme.error;
        title = 'Solicitud no aprobada';
        message =
            'Tu score crediticio no alcanza el mínimo '
            'requerido para este producto.';
      default:
        icon = Icons.cancel;
        color = colorScheme.error;
        title = 'Solicitud no aprobada';
        message =
            'No podemos continuar con tu solicitud '
            'tras nuestra validación de cumplimiento.';
    }

    final location = [
      application.city,
      application.region,
      application.country,
    ].whereType<String>().join(', ');

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          icon,
          size: 72,
          color: color,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          message,
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        if (application.serverId != null)
          _buildDetail(
            'Número de solicitud',
            '${application.serverId}',
          ),
        if (application.creditScore != null)
          _buildDetail(
            'Score crediticio',
            application.creditScore!.toStringAsFixed(2),
          ),
        if (application.riskLevel != null)
          _buildDetail(
            'Nivel de riesgo',
            '${_riskLevelLabel(application.riskLevel)} '
                '(${application.riskScore} puntos)',
          ),
        if (location.isNotEmpty)
          _buildDetail('Ubicación detectada', location),
        if (application.ipAddress != null)
          _buildDetail('Dirección IP', application.ipAddress!),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () => _backToDashboard(context, ref),
          child: const Text('Volver a mis solicitudes'),
        ),
      ],
    );
  }

  String _riskLevelLabel(String? riskLevel) {
    switch (riskLevel) {
      case 'LOW':
        return 'Bajo';
      case 'MEDIUM':
        return 'Medio';
      case 'HIGH':
        return 'Alto';
      default:
        return riskLevel ?? '';
    }
  }

  Widget _buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
