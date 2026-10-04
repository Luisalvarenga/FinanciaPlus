import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/media/image_quality_analyzer.dart';
import '../screens/camera_capture_screen.dart';

/// Captures one photo for the identity verification (the document
/// or the selfie), either with the camera or from a file, and warns
/// when the photo is dark, overexposed or blurry.
class IdentityCaptureCard extends StatefulWidget {
  const IdentityCaptureCard({
    super.key,
    required this.title,
    required this.instructions,
    required this.icon,
    required this.onReadyChanged,
    this.useFrontCamera = false,
    this.enabled = true,
  });

  final String title;
  final String instructions;
  final IconData icon;
  final bool useFrontCamera;
  final bool enabled;

  /// Reports whether there is a photo that can be used.
  final ValueChanged<bool> onReadyChanged;

  @override
  State<IdentityCaptureCard> createState() =>
      _IdentityCaptureCardState();
}

class _IdentityCaptureCardState
    extends State<IdentityCaptureCard> {
  final _imagePicker = ImagePicker();

  XFile? _photo;
  ImageQuality? _quality;

  bool _isAnalyzing = false;

  // The person may keep a photo despite the warnings.
  bool _acceptedWithWarnings = false;

  bool get _isReady {
    final quality = _quality;

    if (_photo == null || quality == null) {
      return false;
    }

    return quality.isAcceptable ||
        (quality.isReadable && _acceptedWithWarnings);
  }

  Future<void> _takePhoto() async {
    final photo = await Navigator.of(context).push<XFile>(
      MaterialPageRoute(
        builder: (context) => CameraCaptureScreen(
          title: widget.title,
          instructions: widget.instructions,
          useFrontCamera: widget.useFrontCamera,
        ),
      ),
    );

    if (photo != null) {
      await _analyze(photo);
    }
  }

  Future<void> _chooseFile() async {
    try {
      final photo = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1600,
        imageQuality: 85,
      );

      if (photo != null) {
        await _analyze(photo);
      }
    } catch (exception) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo abrir el archivo.'),
        ),
      );
    }
  }

  Future<void> _analyze(XFile photo) async {
    if (!mounted) {
      return;
    }

    setState(() {
      _photo = photo;
      _quality = null;
      _isAnalyzing = true;
      _acceptedWithWarnings = false;
    });

    widget.onReadyChanged(false);

    final quality = await ImageQualityAnalyzer.analyze(
      await photo.readAsBytes(),
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _quality = quality;
      _isAnalyzing = false;
    });

    widget.onReadyChanged(_isReady);
  }

  void _acceptWithWarnings() {
    setState(() {
      _acceptedWithWarnings = true;
    });

    widget.onReadyChanged(_isReady);
  }

  String _describe(ImageQualityIssue issue) {
    switch (issue) {
      case ImageQualityIssue.unreadable:
        return 'No se pudo leer la imagen. Prueba con otra.';
      case ImageQualityIssue.tooDark:
        return 'La foto está muy oscura. Busca un lugar con más luz.';
      case ImageQualityIssue.tooBright:
        return 'La foto tiene demasiada luz. '
            'Evita la luz directa y los reflejos.';
      case ImageQualityIssue.blurry:
        return 'La foto se ve borrosa. '
            'Mantén el dispositivo firme e inténtalo de nuevo.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final photo = _photo;
    final quality = _quality;

    final canInteract = widget.enabled && !_isAnalyzing;

    final hasWarnings = quality != null &&
        quality.isReadable &&
        !quality.isAcceptable &&
        !_acceptedWithWarnings;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(widget.icon),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.title,
                    style:
                        Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (_isReady)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(widget.instructions),
            if (photo != null) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(photo.path),
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 60,
                      child: Center(
                        child: Icon(Icons.broken_image),
                      ),
                    );
                  },
                ),
              ),
            ],
            if (_isAnalyzing) ...[
              const SizedBox(height: 12),
              const LinearProgressIndicator(),
              const SizedBox(height: 4),
              const Text('Revisando la calidad de la foto...'),
            ],
            if (quality != null && !quality.isAcceptable) ...[
              const SizedBox(height: 12),
              for (final issue in quality.issues)
                Text(
                  _describe(issue),
                  style: TextStyle(
                    color: _acceptedWithWarnings
                        ? null
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
            ],
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton.icon(
                  onPressed: canInteract ? _takePhoto : null,
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: Text(
                    photo == null ? 'Tomar foto' : 'Repetir foto',
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: canInteract ? _chooseFile : null,
                  icon: const Icon(Icons.folder_open),
                  label: const Text('Elegir archivo'),
                ),
                if (hasWarnings)
                  TextButton(
                    onPressed:
                        canInteract ? _acceptWithWarnings : null,
                    child: const Text('Usar esta foto de todos modos'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
