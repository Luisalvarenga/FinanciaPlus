import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// Opens the device camera and returns the photo taken as an
/// [XFile], or nothing when the person goes back without capturing.
class CameraCaptureScreen extends StatefulWidget {
  const CameraCaptureScreen({
    super.key,
    required this.title,
    required this.instructions,
    this.useFrontCamera = false,
  });

  final String title;
  final String instructions;

  /// Selfies use the front camera when the device has one.
  final bool useFrontCamera;

  @override
  State<CameraCaptureScreen> createState() =>
      _CameraCaptureScreenState();
}

class _CameraCaptureScreenState
    extends State<CameraCaptureScreen> {
  CameraController? _controller;
  String? _errorMessage;
  bool _isCapturing = false;

  @override
  void initState() {
    super.initState();

    _openCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _openCamera() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        _showError(
          'No se encontró ninguna cámara en este dispositivo. '
          'Regresa y elige un archivo.',
        );
        return;
      }

      final preferredDirection = widget.useFrontCamera
          ? CameraLensDirection.front
          : CameraLensDirection.back;

      // Desktop webcams report an external lens, so the first
      // camera is used when the preferred one does not exist.
      final camera = cameras.firstWhere(
        (camera) => camera.lensDirection == preferredDirection,
        orElse: () => cameras.first,
      );

      final controller = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await controller.initialize();

      if (!mounted) {
        await controller.dispose();
        return;
      }

      setState(() {
        _controller = controller;
      });
    } on CameraException catch (exception) {
      _showError(
        'No se pudo abrir la cámara. Revisa el permiso '
        'de cámara e inténtalo de nuevo. (${exception.code})',
      );
    } catch (exception) {
      _showError(
        'La cámara no está disponible en este dispositivo. '
        'Regresa y elige un archivo.',
      );
    }
  }

  void _showError(String message) {
    if (!mounted) {
      return;
    }

    setState(() {
      _errorMessage = message;
    });
  }

  Future<void> _capture() async {
    final controller = _controller;

    if (controller == null || _isCapturing) {
      return;
    }

    setState(() {
      _isCapturing = true;
    });

    try {
      final photo = await controller.takePicture();

      if (!mounted) {
        return;
      }

      Navigator.of(context).pop(photo);
    } on CameraException catch (exception) {
      setState(() {
        _isCapturing = false;
      });

      _showError(
        'No se pudo tomar la foto. (${exception.code})',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    final errorMessage = _errorMessage;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: errorMessage != null
                  ? Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : controller == null
                      ? const CircularProgressIndicator()
                      : CameraPreview(controller),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.instructions,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: FloatingActionButton.large(
              onPressed: controller == null || _isCapturing
                  ? null
                  : _capture,
              child: _isCapturing
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }
}
