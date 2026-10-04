import 'package:dio/dio.dart';

class ApiException implements Exception {
  ApiException({
    required this.message,
    this.statusCode,
  });

  final String message;
  final int? statusCode;

  factory ApiException.fromDioException(DioException exception) {
    final statusCode = exception.response?.statusCode;
    final responseData = exception.response?.data;

    if (responseData is Map<String, dynamic>) {
      final message = responseData['message'];

      if (message is String && message.isNotEmpty) {
        return ApiException(
          message: message,
          statusCode: statusCode,
        );
      }
    }

    return ApiException(
      message: _defaultMessage(statusCode),
      statusCode: statusCode,
    );
  }

  static String _defaultMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Los datos enviados no son válidos.';
      case 401:
        return 'Tu sesión expiró. Inicia sesión de nuevo.';
      case 403:
        return 'No tienes permiso para realizar esta operación.';
      case 404:
        return 'No se encontró el recurso solicitado.';
      case 409:
        return 'El cliente ya existe.';
      case 500:
        return 'Ocurrió un error inesperado en el servidor.';
      case 502:
        return 'Un servicio externo no está disponible en este momento.';
      default:
        return 'No se pudo completar la operación. Revisa tu conexión.';
    }
  }

  @override
  String toString() => message;
}