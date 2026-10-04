import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/client.dart';
import '../../domain/entities/identity_verification.dart';
import '../providers/onboarding_controller.dart';
import '../providers/onboarding_providers.dart';
import '../providers/onboarding_state.dart';
import '../widgets/identity_capture_card.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends ConsumerState<OnboardingScreen> {
  static const _genderLabels = {
    'MALE': 'Masculino',
    'FEMALE': 'Femenino',
    'OTHER': 'Otro',
  };

  final _formKey = GlobalKey<FormState>();

  final _addressController = TextEditingController();
  final _birthDateController = TextEditingController();

  DateTime? _birthDate;
  String? _gender;

  bool _filledFromBank = false;

  // Whether each capture has a usable photo. The photos stay on
  // the device: the biometric comparison is simulated.
  bool _documentCaptured = false;
  bool _selfieCaptured = false;

  // Incremented to clear both captures after a failed match.
  int _captureAttempt = 0;

  bool _isVerifying = false;
  IdentityVerification? _verification;

  @override
  void initState() {
    super.initState();

    Future.microtask(_prefillProfile);
  }

  @override
  void dispose() {
    _addressController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  /// Fills the form with what is already known: the saved profile,
  /// or the bank's records when the person is an existing customer.
  Future<void> _prefillProfile() async {
    try {
      final client = await ref.read(
        currentClientProvider.future,
      );

      if (!mounted) {
        return;
      }

      if (client.profileComplete) {
        _fillProfile(
          address: client.address!,
          birthDate: client.birthDate!,
          gender: client.gender!,
        );
        return;
      }

      final customer = await ref
          .read(onboardingControllerProvider.notifier)
          .findBankCustomer(client.documentNumber);

      if (!mounted || customer == null) {
        return;
      }

      _fillProfile(
        address: customer.address,
        birthDate: customer.birthDate,
        gender: customer.gender,
        fromBank: true,
      );
    } catch (exception) {
      // The screen already reports that the client failed to load.
    }
  }

  void _fillProfile({
    required String address,
    required DateTime birthDate,
    required String gender,
    bool fromBank = false,
  }) {
    setState(() {
      _addressController.text = address;
      _birthDate = birthDate;
      _birthDateController.text = _formatDate(birthDate);
      _gender = gender;
      _filledFromBank = fromBank;
    });
  }

  Future<void> _pickBirthDate() async {
    final today = DateTime.now();

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: today.subtract(const Duration(days: 1)),
    );

    if (selectedDate == null) {
      return;
    }

    setState(() {
      _birthDate = selectedDate;
      _birthDateController.text = _formatDate(selectedDate);
    });
  }

  String _formatDate(DateTime date) {
    return date.toIso8601String().substring(0, 10);
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    await ref
        .read(onboardingControllerProvider.notifier)
        .saveProfile(
          address: _addressController.text,
          birthDate: _birthDate!,
          gender: _gender!,
        );
  }

  Future<void> _verifyIdentity() async {
    setState(() {
      _isVerifying = true;
    });

    final verification = await ref
        .read(onboardingControllerProvider.notifier)
        .verifyIdentity();

    if (!mounted) {
      return;
    }

    setState(() {
      _isVerifying = false;
      _verification = verification;

      // A failed match requires new captures before retrying.
      if (verification != null && !verification.approved) {
        _documentCaptured = false;
        _selfieCaptured = false;
        _captureAttempt++;
      }
    });
  }

  String? _requiredValidator(
    String? value,
    String fieldName,
  ) {
    if (value == null || value.trim().isEmpty) {
      return 'El campo $fieldName es obligatorio.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<OnboardingState>(
      onboardingControllerProvider,
      (previous, next) {
        next.when(
          initial: () {},
          loading: () {},
          success: (client) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Tu información se guardó.'),
              ),
            );
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

    final clientState = ref.watch(currentClientProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
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
        data: (client) => Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                children: [
                  _buildProfileSection(context, client),
                  const SizedBox(height: 24),
                  _buildIdentitySection(context, client),
                  if (client.profileComplete &&
                      client.identityVerified) ...[
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: () =>
                          context.pushReplacement(
                        '/credit-application',
                      ),
                      child: const Text(
                        'Continuar con la solicitud',
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(
    BuildContext context,
    Client client,
  ) {
    final isLoading = ref
        .watch(onboardingControllerProvider)
        .maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionTitle(
            context,
            '1. Datos personales',
            client.profileComplete,
          ),
          const SizedBox(height: 8),
          Text(
            '${client.firstName} ${client.lastName} · '
            '${client.documentNumber}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (_filledFromBank) ...[
            const SizedBox(height: 8),
            const Text(
              'Ya eres cliente de FinanciaPlus, así que completamos '
              'tus datos automáticamente. Revísalos y guarda.',
            ),
          ],
          const SizedBox(height: 16),

          TextFormField(
            controller: _birthDateController,
            enabled: !isLoading,
            readOnly: true,
            onTap: _pickBirthDate,
            decoration: const InputDecoration(
              labelText: 'Fecha de nacimiento',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today),
            ),
            validator: (value) => _requiredValidator(
              value,
              'Fecha de nacimiento',
            ),
          ),

          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            // Rebuilt when the value is filled in automatically.
            key: ValueKey(_gender),
            initialValue: _gender,
            decoration: const InputDecoration(
              labelText: 'Género',
              border: OutlineInputBorder(),
            ),
            items: _genderLabels.entries
                .map(
                  (entry) => DropdownMenuItem(
                    value: entry.key,
                    child: Text(entry.value),
                  ),
                )
                .toList(),
            onChanged: isLoading
                ? null
                : (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
            validator: (value) => _requiredValidator(
              value,
              'Género',
            ),
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: _addressController,
            enabled: !isLoading,
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: 'Dirección',
              border: OutlineInputBorder(),
            ),
            validator: (value) => _requiredValidator(
              value,
              'Dirección',
            ),
          ),

          const SizedBox(height: 16),

          FilledButton(
            onPressed: isLoading ? null : _saveProfile,
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : const Text('Guardar datos'),
          ),
        ],
      ),
    );
  }

  Widget _buildIdentitySection(
    BuildContext context,
    Client client,
  ) {
    final verification = _verification;
    final biometricScore = client.biometricScore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSectionTitle(
          context,
          '2. Verificación de identidad',
          client.identityVerified,
        ),
        const SizedBox(height: 8),
        if (!client.profileComplete)
          const Text(
            'Primero guarda tus datos personales.',
          )
        else if (client.identityVerified)
          Text(
            biometricScore == null
                ? 'Tu identidad fue verificada.'
                : 'Tu identidad fue verificada con una coincidencia de '
                    '${biometricScore.toStringAsFixed(2)}%.',
          )
        else ...[
          const Text(
            'Captura tu documento de identidad y una selfie. '
            'Revisamos la luz y el enfoque de las fotos, que '
            'se quedan en este dispositivo; la comparación biométrica '
            'es simulada en esta versión.',
          ),
          const SizedBox(height: 16),
          IdentityCaptureCard(
            // A new attempt starts with empty captures.
            key: ValueKey('document-$_captureAttempt'),
            title: 'Documento de identidad',
            instructions:
                'Coloca el frente de tu documento sobre una superficie '
                'plana, con buena luz y sin reflejos.',
            icon: Icons.badge_outlined,
            enabled: !_isVerifying,
            onReadyChanged: (isReady) {
              setState(() {
                _documentCaptured = isReady;
              });
            },
          ),
          const SizedBox(height: 8),
          IdentityCaptureCard(
            key: ValueKey('selfie-$_captureAttempt'),
            title: 'Selfie',
            instructions:
                'Mira de frente a la cámara, con el rostro '
                'bien iluminado y sin nada que lo cubra.',
            icon: Icons.face_outlined,
            useFrontCamera: true,
            enabled: !_isVerifying,
            onReadyChanged: (isReady) {
              setState(() {
                _selfieCaptured = isReady;
              });
            },
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _documentCaptured &&
                    _selfieCaptured &&
                    !_isVerifying
                ? _verifyIdentity
                : null,
            child: _isVerifying
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : const Text('Verificar identidad'),
          ),
          if (verification != null &&
              !verification.approved) ...[
            const SizedBox(height: 12),
            Text(
              '${verification.message} '
              '(${verification.similarity.toStringAsFixed(2)}% '
              'de coincidencia, se requiere 80%)',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ],
      ],
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    bool isDone,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        if (isDone)
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
      ],
    );
  }
}
