import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/credit_application_controller.dart';
import '../providers/credit_application_state.dart';
import '../providers/onboarding_providers.dart';

class CreditApplicationScreen extends ConsumerStatefulWidget {
  const CreditApplicationScreen({super.key});

  @override
  ConsumerState<CreditApplicationScreen> createState() =>
      _CreditApplicationScreenState();
}

class _CreditApplicationScreenState
    extends ConsumerState<CreditApplicationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    await ref
        .read(
          creditApplicationControllerProvider
              .notifier,
        )
        .createApplication(
          requestedAmount: double.parse(
            _amountController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<CreditApplicationState>(
      creditApplicationControllerProvider,
      (previous, next) {
        next.when(
          initial: () {},
          loading: () {},
          success: (application) {
            context.go('/application-result');
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          },
        );
      },
    );

    final applicationState =
        ref.watch(
      creditApplicationControllerProvider,
    );

    final clientState =
        ref.watch(currentClientProvider);

    final isLoading =
        applicationState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva solicitud'),
      ),
      body: clientState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => const Center(
          child: Text(
            'No se pudo cargar tu información.',
          ),
        ),
        data: (client) {
          if (!client.profileComplete ||
              !client.identityVerified) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Completa tu onboarding antes de solicitar.',
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () =>
                        context.pushReplacement(
                      '/onboarding',
                    ),
                    child: const Text(
                      'Continuar onboarding',
                    ),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Cuenta Digital + Tarjeta de Débito',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Cliente: ${client.firstName} '
                        '${client.lastName}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Documento: ${client.documentNumber}',
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller:
                            _amountController,
                        enabled: !isLoading,
                        keyboardType:
                            const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration:
                            const InputDecoration(
                          labelText:
                              'Límite diario de transacciones',
                          helperText:
                              'Monto máximo que quieres gastar '
                              'por día con tu tarjeta de débito.',
                          prefixText: '\$ ',
                          border:
                              OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return
                                'El límite diario es obligatorio.';
                          }

                          final amount =
                              double.tryParse(
                            value.trim(),
                          );

                          if (amount == null) {
                            return
                                'Ingresa un monto válido.';
                          }

                          if (amount <= 0) {
                            return
                                'El límite debe ser mayor que cero.';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed:
                            isLoading ? null : _submit,
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Enviar solicitud',
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
