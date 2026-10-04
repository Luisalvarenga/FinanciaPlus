class AppConstants {
  AppConstants._();

  static const String appName = 'FinanciaPlus';

  /// Defaults to the backend on this machine. A phone or emulator
  /// needs the address of the computer running the backend:
  ///
  ///   flutter run --dart-define=API_BASE_URL=http://192.168.1.10:8080
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8080',
  );
}
